require 'rspec'
require_relative '../grid'

RSpec.describe 'Grid creation' do
  it 'creates a new grid successfully' do
    grid = Grid.new(10, 10)
    array = grid.send(:prepare_grid)

    expect(grid.rows).to eq(10)
    expect(grid.columns).to eq(10)

    expect(array.size).to eq(10)
    expect(array[0].size).to eq(10)
  end
end

RSpec.describe 'Grid custom array accessor' do
  it 'returns the cell instance if coordinates are inside the grid' do
    grid = Grid.new(10, 10)
    cell = grid[0, 1]

    expect(cell).not_to eq(nil)
  end

  it 'returns nil if coordinates are outside the grid' do
    grid = Grid.new(10, 10)
    cell = grid[11, 11]

    expect(cell).to eq(nil)
  end
end

RSpec.describe 'Grid random cell' do
  it 'should return a non-nil cell' do
    grid = Grid.new(10, 10)
    cell = grid.random_cell

    expect(cell).not_to eq(nil)
  end
end

RSpec.describe 'Grid size' do
  it 'should be rows * columns' do
    grid = Grid.new(10, 10)

    expect(grid.size).to eq(100)
  end
end

RSpec.describe 'Grid iteration' do
  it 'should iterate over each row correctly' do
    grid = Grid.new(10, 10)

    counter = 0
    grid.each_row { counter += 1 }

    expect(counter).to eq(grid.rows)

  end
end