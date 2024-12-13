class Cell
  attr_reader :row, :column
  attr_accessor :north, :south, :east, :west

  def initialize(row, column)
    @row = row
    @column = column
    @links = {}
  end

  def link(cell, bidirectional = true)
    @links[cell] = true
    cell.link(self, false) if bidirectional
    self
  end

  def linked?(cell)
    @links.key?(cell)
  end
end
