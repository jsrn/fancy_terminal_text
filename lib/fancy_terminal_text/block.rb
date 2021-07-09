module FTT
  class Block
    attr_reader :components

    def initialize(*components)
      @components = normalised_components(components)
    end

    def to_s
      @components.collect(&:to_s).join("\n")
    end

    def visual_length
      @components.collect(&:visual_length).sum
    end

    def pad(top = 1, left = 1, right = 1, bottom = 1)
      top_padding = Array.new(top) { FTT::Text.new('') }
      bottom_padding = Array.new(bottom) { FTT::Text.new('') }
      padded_top_and_bottom = self.class.new(*top_padding, *@components, *bottom_padding)

      padded_all = padded_top_and_bottom.components.map do |line|
        l = line.left_pad(line.visual_length + left)
        l.right_pad(l.visual_length + right)
      end

      FTT::Block.new(*padded_all)
    end

    def border(chars = FTT::Borders::HASH)
      top_border = ''

      (components.first.visual_length + 2).times do
        top_border << chars.sample
      end

      middle = components.map do |c|
        FTT::Line.new(FTT::Text.new(chars.sample), c, FTT::Text.new(chars.sample))
      end

      bottom_border = ''

      (components.first.visual_length + 2).times do
        bottom_border << chars.sample
      end

      Block.new(FTT::Text.new(top_border), *middle, FTT::Text.new(bottom_border))
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
