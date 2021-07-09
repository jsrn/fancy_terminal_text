module FTT
  class Block
    def initialize(*components)
      @components = normalised_components(components)
    end

    def to_s
      @components.collect(&:to_s).join("\n")
    end

    def visual_length
      @components.collect(&:visual_length).sum
    end

    private

    def normalised_components(components)
      max_length = components.collect(&:visual_length).max
      components.map do |component|
        FTT::Text.new(component.to_s).right_pad(max_length)
      end
    end
  end
end
