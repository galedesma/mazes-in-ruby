# frozen_string_literal: true

require 'rspec'
require_relative '../domain/binary_tree'
require_relative '../domain/grid'

RSpec.describe 'BinaryTree' do
  it 'should return a grid' do
    grid = Grid.new(5, 5)
    maze = BinaryTree.on(grid)

    expect(maze).not_to eq(nil)
  end
end
