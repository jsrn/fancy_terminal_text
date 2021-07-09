require 'ostruct'

module FFT
  class Util
    def self.term_dimensions
      width, height = `stty size`.chomp.split(' ').map(&:to_i)
      OpenStruct.new(width: width, height: height)
    end
  end
end
