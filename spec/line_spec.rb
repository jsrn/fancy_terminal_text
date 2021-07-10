require_relative '../lib/fancy_terminal_text'

RSpec.describe "Line#visual_length" do
  it "takes the visual length of a line from the sum of its parts" do
    left = FTT::Text.new('foo').bold
    right = FTT::Text.new('bar').colour(:red)

    expect(FTT::Line.new(left, right).visual_length).to eq(6)
  end
end

RSpec.describe "Line#bold" do
  it "bolds all component parts" do
    left = FTT::Text.new('foo').bold
    right = FTT::Text.new('bar')
    expect(FTT::Line.new(left, right).bold.to_s).to eq("\033[1mfoobar\033[0m")
  end
end
