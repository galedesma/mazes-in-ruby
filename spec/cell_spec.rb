require 'rspec'
require_relative '../cell'

RSpec.describe 'Cell' do
  it "should get created successfully" do
    cell = Cell.new(0, 0)
    expect(cell).not_to eq(nil)
  end
end