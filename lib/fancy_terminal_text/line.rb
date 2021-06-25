module FTT
  class Line
    def initialize(*segments)
      @segments = segments
    end

    def to_s
      @segments.collect(&:to_s).join
    end

    def visual_length
      @segments.collect(&:visual_length).sum
    end
  end
end
