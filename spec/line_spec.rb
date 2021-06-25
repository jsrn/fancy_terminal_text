require_relative '../lib/fancy_terminal_text'

RSpec.describe "Line#visual_length" do
  it "takes the visual length of a line from the sum of its parts" do
    left = FTT::Text.new('foo').bold
    right = FTT::Text.new('bar').colour(:red)

    expect(FTT::Line.new(left, right).visual_length).to eq(6)
  end
end
