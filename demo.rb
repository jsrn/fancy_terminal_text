#!/usr/bin/env ruby

require "./lib/fancy_terminal_text.rb"

puts FTT::Text.new("# Fancy Terminal Text Demo").bold
puts ""
puts FTT::Text.new("## Text Elements").bold

puts FTT::Text.new("A plain string!")

text = FTT::Text.new("Padding")
puts text.left_pad(0)
puts text.left_pad(8)
puts text.left_pad(9)
puts text.left_pad(10)

print "Some text can be "
puts FTT::Text.new("bold!").bold
print "Some text can be "
puts FTT::Text.new("colourful!").colour(:red)

puts [
       FTT::Text.new('R').colour(:red),
       FTT::Text.new('a').colour(:light_red),
       FTT::Text.new('i').colour(:yellow),
       FTT::Text.new('n').colour(:green),
       FTT::Text.new('b').colour(:blue),
       FTT::Text.new('o').colour(:light_magenta),
       FTT::Text.new('w').colour(:magenta),
     ].join

puts FTT::Text.new('text').colour(:red).centre(6)
