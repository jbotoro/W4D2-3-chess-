require 'colorize'


class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new #does not exist yet
  end

  def render
    system "clear"
    board.rows.each { |row| p row }
  end

end