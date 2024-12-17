# frozen_string_literal: true

require_relative 'cell'

##
# Base Grid class
class Grid
  attr_reader :rows, :columns

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @grid = prepare_grid
    configure_cells
  end

  def random_cell
    row = rand(@rows)
    column = rand(@grid[row].count)
    self[row, column]
  end

  def size
    @rows * @columns
  end

  def each_row(&block)
    @grid.each(&block)
  end

  def each_cell
    each_row do |row|
      row.each do |cell|
        yield cell if cell
      end
    end
  end

  def [](row, column)
    return nil unless row.between?(0, @rows - 1)
    return nil unless column.between?(0, @columns - 1)

    @grid[row][column]
  end

  private

  def prepare_grid
    Array.new(rows) do |row|
      Array.new(columns) do |column|
        Cell.new(row, column)
      end
    end
  end

  def configure_cells
    each_cell do |cell|
      row = cell.row
      column = cell.column
      cell.north = self[row - 1, column]
      cell.south = self[row + 1, column]
      cell.west = self[row, column - 1]
      cell.east = self[row, column + 1]
    end
  end
end
