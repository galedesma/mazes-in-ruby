# frozen_string_literal: true

##
# Binary Tree Algorithm Implementation.
class BinaryTree
  def on(grid)
    grid.each_cell do |cell|
      neighbours = []
      neighbours << cell.north if cell.north
      neighbours << cell.east  if cell.east

      index = rand(neighbours.length)
      neighbour = neighbours[index]

      cell.link(neighbour) if neighbour
    end

    grid
  end
end
