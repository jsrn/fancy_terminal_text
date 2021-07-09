require 'ostruct'

module FFT
  class Util
    def self.term_dimensions
      height, width = `stty size`.chomp.split(' ').map(&:to_i)
      OpenStruct.new(width: width, height: height)
    end

    def self.term_width
      term_dimensions.width
    end

    def self.term_height
      term_dimensions.height
    end
  end
end
