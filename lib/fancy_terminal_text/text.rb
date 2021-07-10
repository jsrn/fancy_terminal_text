require 'colorize'

module FTT
  class Text
    def initialize(string)
      @string = string
    end

    def to_s
      @string
    end

    def visual_length
      # Regex shamelessly taken from https://stackoverflow.com/a/56206076/16164934
      @string.gsub(/\e\[[^\x40-\x7E]*[\x40-\x7E]/, "").length
    end

    def bold
      clean = @string.gsub("\033[1m", "").gsub("\033[0m", "")
      self.class.new("\033[1m#{clean}\033[0m")
    end

    def left_pad(length)
      if @string.length > visual_length
        length = @string.length + (length - visual_length)
      end

      self.class.new(@string.rjust(length))
    end

    def right_pad(length)
      if @string.length > visual_length
        length = @string.length + (length - visual_length)
      end

      self.class.new(@string.ljust(length))
    end

    def centre(length)
      difference = [length - visual_length, 0].max
      return self if difference.zero?

      left = difference / 2
      right = difference - left

      new_string = (' ' * left) << @string << (' ' * right)

      self.class.new(new_string)
    end

    def colour(colour_name)
      raise ArgumentError.new, "Colour name must be one of #{String.colors}" unless String.colors.include?(colour_name)

      self.class.new(@string.colorize(colour_name))
    end
  end
end
