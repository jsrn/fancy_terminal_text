module FTT
  class Block
    attr_reader :lines

    # Create a block from one or more text objects. Each text object will
    # become a line in the block.
    #
    # @param lines [Array<FTT::Text>]
    def initialize(*lines)
      @lines = normalised_lines(lines)
    end

    def to_s
      @lines.collect(&:to_s).join("\n")
    end

    def visual_length
      @lines.collect(&:visual_length).sum
    end

    def pad(top = 1, left = 1, right = 1, bottom = 1)
      top_padding = Array.new(top) { FTT::Text.new('') }
      bottom_padding = Array.new(bottom) { FTT::Text.new('') }
      padded_top_and_bottom = self.class.new(*top_padding, *@lines, *bottom_padding)

      padded_all = padded_top_and_bottom.lines.map do |line|
        l = line.left_pad(line.visual_length + left)
        l.right_pad(l.visual_length + right)
      end

      FTT::Block.new(*padded_all)
    end

    def border(chars = FTT::Borders::HASH)
      top_border = ''

      (lines.first.visual_length + 2).times do
        top_border << chars.sample
      end

      middle = lines.map do |c|
        FTT::Text.from_parts(FTT::Text.new(chars.sample), c, FTT::Text.new(chars.sample))
      end

      bottom_border = ''

      (lines.first.visual_length + 2).times do
        bottom_border << chars.sample
      end

      Block.new(FTT::Text.new(top_border), *middle, FTT::Text.new(bottom_border))
    end

    private

    # Right pad all lines in the block until all lines are equal to the visual
    # length of the longest.
    #
    # @param lines [Array<FTT::Text>]
    def normalised_lines(lines)
      max_length = lines.collect(&:visual_length).max
      lines.map do |line|
        FTT::Text.new(line.to_s).right_pad(max_length)
      end
    end
  end
end
