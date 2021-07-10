require_relative '../lib/fancy_terminal_text'

RSpec.describe "Block#new" do
  it "accepts a collection of components and returns a block" do
    hello = FTT::Text.new('hello')

    ruby = FTT::Text.new('Ruby ').bold
    friends = FTT::Text.new('friends').colour(:red)
    ruby_friends = FTT::Text.from_parts(ruby, friends)

    block = FTT::Block.new(hello, ruby_friends)
    expect(block.to_s).to eq("hello       \n\e[1mRuby \e[0m\e[0;31;49mfriends\e[0m")
  end
end


RSpec.describe "Block#pad" do
  it "pads" do
    padded_result = FTT::Block.new(FTT::Text.new('a')).pad.to_s
    expect(padded_result).to eq("   \n a \n   ")
  end
end

RSpec.describe "Block#border" do
  it "borders" do
    bordered_result = FTT::Block.new(FTT::Text.new('a')).pad.border.to_s
    expect(bordered_result).to eq("#####\n#   #\n# a #\n#   #\n#####")
  end
end
