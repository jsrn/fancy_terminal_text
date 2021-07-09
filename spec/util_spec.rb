require_relative '../lib/fancy_terminal_text'

RSpec.describe "Util.term_dimensions" do
  it "gets the width and height" do
    dimensions = FFT::Util.term_dimensions

    expect(dimensions.width).to be_a(Fixnum)
    expect(dimensions.height).to be_a(Fixnum)
  end
end
