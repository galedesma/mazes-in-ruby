require 'rspec'
require_relative '../cell'

RSpec.describe 'Cell creation' do
  it "should get created successfully" do
    cell = Cell.new(0, 0)
    expect(cell).not_to eq(nil)
  end
end

RSpec.describe 'Cell linking' do
  it "linking a cell 1 to cell 2 should be bidirectional" do
    cell_1 = Cell.new(0, 0)
    cell_2 = Cell.new(1, 1)

    cell_1.link(cell_2)

    expect(cell_1.linked?(cell_2)).to be true
  end

  it "unlinking a cell 1 from cell 2 should be bidirectional" do
    cell_1 = Cell.new(0, 0)
    cell_2 = Cell.new(1, 1)

    cell_1.link(cell_2)
    cell_1.unlink(cell_2)

    expect(cell_1.linked?(cell_2)).to be false
  end

  it "linking cell 1 to two other different cells should be successful" do
    cell_1 = Cell.new(0, 0)
    cell_2 = Cell.new(1, 1)
    cell_3 = Cell.new(2, 2)

    cell_1.link(cell_2)
    cell_1.link(cell_3)

    result = cell_1.links

    expect(result.size).to eq(2)
    expect(cell_1.linked?(cell_2)).to be true
    expect(cell_1.linked?(cell_3)).to be true
  end
end

RSpec.describe 'Cell neighbors' do
  it 'initialized cell should have no neighbors' do
    cell = Cell.new(0, 0)

    result = cell.neighbours

    expect(result.size).to eq(0)
  end
end