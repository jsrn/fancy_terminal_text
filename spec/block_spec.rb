require_relative '../lib/fancy_terminal_text'

RSpec.describe "Block#new" do
  it "accepts a collection of components and returns a block" do
    hello = FTT::Text.new('hello')

    ruby = FTT::Text.new('Ruby ').bold
    friends = FTT::Text.new('friends').colour(:red)
    ruby_friends = FTT::Line.new(ruby, friends)

    block = FTT::Block.new(hello, ruby_friends)
    puts block
  end
end
