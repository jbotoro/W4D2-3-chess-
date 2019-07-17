require 'byebug'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    #@sentinel = NullPiece.instance
    set_board
  end

  def [](pos)
    row, col = pos 
    rows[row][col]
  end

  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end

  def valid_pos?(pos)
    row, col = pos
    return true if row.between?(0, 7) && col.between?(0, 7)
    false
  end

  def add_piece(piece, pos)

  end

  def move_piece(start_pos, end_pos)
    raise "no piece here" if self[start_pos].nil?
    raise "not valid move" unless valid_pos?(end_pos)
    # still need to check if the piece's color to see if valid

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end


  def set_board
    rows.each_with_index do |row, idx|
      if idx.between?(2,5)
        row.map! { |ele| ele = nil }
      else
        row.map! { |ele| ele = 'a' } #Piece.new }
      end
    end
  end

  def render
    @rows.each do |row|
      p row
    end
  end

end

board = Board.new
# board.move_piece([3,3],[1,1])
# board.move_piece([0,8],[1,1])
board.move_piece([0,0],[2,2])
board.render