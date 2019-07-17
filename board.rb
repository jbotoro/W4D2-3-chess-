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
    if row.between?(0, 7) && col.between?(0, 7)
      return true 
    end
    false
  end

  def add_piece(piece, pos)

  end

  def move_piece(start_pos, end_pos)
    raise "you have no piece here" if self[start_pos].nil?
    raise "This position is not on the board" unless valid_pos?(end_pos)
    raise "You already have a peice here" if self[start_pos].color == self[end_pos].color

    self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
  end


  def set_board
    rows.each_with_index do |row, idx_1|
      if idx_1.between?(2,5)
        row.map! { |ele| ele = nil }
      elsif idx_1 == 0 || idx_1 == 7
        row.each_with_index do |col, idx_2|
          if idx_1 == 0
            piece = self[[idx_1, idx_2]]
            case idx_2
            when 0
              piece = Rook.new(:B, self, [idx_1,idx_2])
            when 1
              piece = Knight.new(:B, self, [idx_1,idx_2])
            when 2
              piece = Bishop.new(:B, self, [idx_1,idx_2])
            when 3 
              piece = Queen.new(:B, self, [idx_1,idx_2])
            when 4
              piece = King.new(:B, self, [idx_1,idx_2])
            when 5
              piece = Bishop.new(:B, self, [idx_1,idx_2])
            when 6
              piece = Knight.new(:B, self, [idx_1,idx_2])
            when 7
              piece = Rook.new(:B, self, [idx_1,idx_2])
            
            end
          else
            piece = self[idx_1, idx_2]
            case idx_2
            when 0
              piece = Rook.new(:W, self, [idx_1,idx_2])
            when 1
              piece = Knight.new(:W, self, [idx_1,idx_2])
            when 2
              piece = Bishop.new(:W, self, [idx_1,idx_2])
            when 3 
              piece = Queen.new(:W, self, [idx_1,idx_2])
            when 4
              piece = King.new(:W, self, [idx_1,idx_2])
            when 5
              piece = Bishop.new(:W, self, [idx_1,idx_2])
            when 6
              piece = Knight.new(:W, self, [idx_1,idx_2])
            when 7
              piece = Rook.new(:W, self, [idx_1,idx_2])
            end
          end
        end
      elsif idx_1 == 1 || idx_1 == 6
        if idx_1 == 1
          row.map!.with_index { |ele, idx_2| ele = Pawn.new('black', self, self[idx_1, idx_2]) }
        else
          row.map!.with_index { |ele, idx_2| ele = Pawn.new('white', self, self[idx_1, idx_2]) }
        end
      end
    end
  end

  def render
    @rows.each { |row| p row }
  end

end

board = Board.new
# board.move_piece([3,3],[1,1])
# board.move_piece([0,8],[1,1])
board.move_piece([0,0],[2,2])
board.render