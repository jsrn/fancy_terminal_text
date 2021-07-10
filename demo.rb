#!/usr/bin/env ruby

require "./lib/fancy_terminal_text.rb"

sprinkle = FTT::Text.new("sprinkle").rainbow

puts <<-DEMO
#{FTT::Text.new("# Fancy Terminal Text Demo").bold}

#{FTT::Text.new("## Text Elements").bold}

#{FTT::Text.new("Text can be totally plain.")}

It can have a little #{FTT::Text.new("splash").colour(:red)} of colour. Heck, give it a whole #{sprinkle}.

You can nudge your text...
#{FTT::Text.new("in a little...").left_pad(15)}
#{FTT::Text.new("... or just centre it.").centre(FTT::Util.term_width)}

Now #{FTT::Text.new("that's").italic.underline} #{FTT::Text.new('bold!').bold}


#{FTT::Text.new("## Borders & Padding").bold}

#{FTT::Block.new(FTT::Text.new("You can pad and border me.").colour(:green)).pad.border}

#{FTT::Block.new(FTT::Text.new('You can make me take up the whole terminal!').bold.centre(FTT::Util.term_width - 4)).pad.border}
DEMO
