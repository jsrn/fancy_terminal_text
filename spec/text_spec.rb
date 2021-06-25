require_relative '../lib/fancy_terminal_text'

RSpec.describe "Text" do
  it "test_text_returns_itself" do
    expect(FTT::Text.new('text').to_s).to eq('text')
  end
end

RSpec.describe "Text#visual_length" do
  it "behaves normally for standard text" do
    text = FTT::Text.new("Text")
    expect(text.visual_length).to eq(4)
  end

  it "ignores codepoints on bold text" do
    text = FTT::Text.new("Text").bold
    expect(text.visual_length).to eq(4)
  end

  it "ignores even more codepoints" do
    text = FTT::Text.new("Text").bold.colour(:red)
    expect(text.visual_length).to eq(4)
  end
end

RSpec.describe "Text#colour" do
  it "wraps text in control sequences for colour" do
    text = FTT::Text.new('text')
    expect(text.colour(:red).to_s).to eq("\e[0;31;49mtext\e[0m")
  end

  it "rejects unknown colours" do
    text = FTT::Text.new('text')
    expect { text.colour(:unknown) }.to raise_error(ArgumentError)
  end
end

RSpec.describe "Text#left_pad" do
  it "left pads text" do
    text = FTT::Text.new('text')
    expect(text.left_pad(4).to_s).to eq('text')
    expect(text.left_pad(5).to_s).to eq(' text')
  end

  it "visual length is unaffected by formatting" do
    text = FTT::Text.new('text').colour(:red).bold.left_pad(5)
    expect(text.visual_length).to eq(5)
  end
end

RSpec.describe "Text#leftright_pad" do
  it "right pads text" do
    text = FTT::Text.new('text')
    expect(text.right_pad(4).to_s).to eq('text')
    expect(text.right_pad(5).to_s).to eq('text ')
  end

  it "visual length is unaffected by formatting" do
    text = FTT::Text.new('text').colour(:red).bold.right_pad(5)
    expect(text.visual_length).to eq(5)
  end
end

RSpec.describe "Text#centre" do
  it "centres text" do
    text = FTT::Text.new('text')
    expect(text.centre(4).to_s).to eq('text')
    expect(text.centre(5).to_s).to eq('text ')
    expect(text.centre(6).to_s).to eq(' text ')
  end

  it "centres coloured text, too" do
    text = FTT::Text.new('text').colour(:red)
    expect(text.centre(4).visual_length).to eq(4)
    expect(text.centre(5).visual_length).to eq(5)
    expect(text.centre(6).visual_length).to eq(6)
  end
end
