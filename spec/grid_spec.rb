require 'rspec'
require_relative '../grid'

RSpec.describe 'Grid creation' do
  it 'creates a new grid successfully' do
    grid = Grid.new(10, 10)
    array = grid.prepare_grid

    expect(grid.rows).to eq(10)
    expect(grid.columns).to eq(10)

    expect(array.size).to eq(10)
    expect(array[0].size).to eq(10)
  end
end