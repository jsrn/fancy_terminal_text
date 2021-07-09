require_relative '../lib/fancy_terminal_text'

RSpec.describe "Util.term_dimensions" do
  it "gets the width and height" do
    dimensions = FTT::Util.term_dimensions

    expect(dimensions.width).to be_a(Fixnum)
    expect(dimensions.height).to be_a(Fixnum)
  end
end

RSpec.describe "Util.term_height" do
  it "gets the term height" do
    expect(FTT::Util.term_height).to be_a(Fixnum)
  end
end

RSpec.describe "Util.term_width" do
  it "gets the term width" do
    expect(FTT::Util.term_width).to be_a(Fixnum)
  end
end
