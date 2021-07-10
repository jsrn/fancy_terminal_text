require 'colorize'

module FTT
  class Text
    def self.from_parts(*segments)
      new(segments.collect(&:to_s).join)
    end

    # @param string [String]
    def initialize(string)
      @string = string
    end

    def to_s
      @string
    end

    # The length of the string in terms of how much space it actually occupies
    # on screen, without things like control characters.
    #
    # @return [Integer]
    def visual_length
      # Regex shamelessly taken from https://stackoverflow.com/a/56206076/16164934
      @string.gsub(/\e\[[^\x40-\x7E]*[\x40-\x7E]/, "").length
    end

    # Bolds the text.
    #
    # @return [Text]
    def bold
      clean = @string.gsub("\033[1m", "").gsub("\033[0m", "")
      self.class.new("\033[1m#{clean}\033[0m")
    end

    # Italicises the text.
    #
    # @return [Text]
    def italic
      clean = @string.gsub("\e[3m", "").gsub("\e[0m", "")
      self.class.new("\e[3m#{clean}\e[0m")
    end

    # Underlines the text.
    #
    # @return [Text]
    def underline
      clean = @string.gsub("\e[4m", "").gsub("\e[0m", "")
      self.class.new("\e[4m#{clean}\e[0m")
    end

    def rainbow
      new_string = ""

      FTT::Colours::RAINBOW.cycle(2).each_with_index do |colour, index|
        character = @string[index]
        break if character.nil?

        if character =~ /[^[:print:]]/
          new_string << character
        else
          new_string << "\e[#{colour}m#{character}\e[0m"
        end
      end

      FTT::Text.new(new_string)
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
