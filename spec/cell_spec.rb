# frozen_string_literal: true

require 'rspec'
require_relative '../cell'

RSpec.describe 'Cell creation' do
  it 'should get created successfully' do
    cell = Cell.new(0, 0)
    expect(cell).not_to eq(nil)
  end
end

RSpec.describe 'Cell linking' do
  it 'linking a cell 1 to cell 2 should be bidirectional' do
    cell1 = Cell.new(0, 0)
    cell2 = Cell.new(1, 1)

    cell1.link(cell2)

    expect(cell1.linked?(cell2)).to be true
  end

  it 'unlinking a cell 1 from cell 2 should be bidirectional' do
    cell1 = Cell.new(0, 0)
    cell2 = Cell.new(1, 1)

    cell1.link(cell2)
    cell1.unlink(cell2)

    expect(cell1.linked?(cell2)).to be false
  end

  it 'linking cell 1 to two other different cells should be successful' do
    cell1 = Cell.new(0, 0)
    cell2 = Cell.new(1, 1)
    cell3 = Cell.new(2, 2)

    cell1.link(cell2)
    cell1.link(cell3)

    result = cell1.links

    expect(result.size).to eq(2)
    expect(cell1.linked?(cell2)).to be true
    expect(cell1.linked?(cell3)).to be true
  end
end

RSpec.describe 'Cell neighbors' do
  it 'initialized cell should have no neighbors' do
    cell = Cell.new(0, 0)

    result = cell.neighbours

    expect(result.size).to eq(0)
  end
end
