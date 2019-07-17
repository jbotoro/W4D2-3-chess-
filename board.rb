require 'byebug'
require_relative 'all_pieces'


class Board
  attr_reader :rows, :sentinel

  def initialize
    @rows = Array.new(8) { Array.new(8) }
    @sentinel = NullPiece.instance
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
        row.map! { |ele| ele = sentinel }
      elsif idx_1 == 0 || idx_1 == 7
        row.each_with_index do |col, idx_2|
          if idx_1 == 0
            pos = [idx_1,idx_2]
            case idx_2
            when 0
              self[pos] = Rook.new(:B, self, pos)
            when 1
              self[pos] = Knight.new(:B, self, pos)
            when 2
              self[pos] = Bishop.new(:B, self, pos)
            when 3 
              self[pos] = Queen.new(:B, self, pos)
            when 4
              self[pos] = King.new(:B, self, pos)
            when 5
              self[pos] = Bishop.new(:B, self, pos)
            when 6
              self[pos] = Knight.new(:B, self, pos)
            when 7
              self[pos] = Rook.new(:B, self, pos)
            end
          else
            pos = [idx_1,idx_2]
            case idx_2
            when 0
              self[pos] = Rook.new(:W, self, pos)
            when 1
              self[pos] = Knight.new(:W, self, pos)
            when 2
              self[pos] = Bishop.new(:W, self, pos)
            when 3 
              self[pos] = Queen.new(:W, self, pos)
            when 4
              self[pos] = King.new(:W, self, pos)
            when 5
              self[pos] = Bishop.new(:W, self, pos)
            when 6
              self[pos] = Knight.new(:W, self, pos)
            when 7
              self[pos] = Rook.new(:W, self, pos)
            end
          end
        end
      elsif idx_1 == 1 || idx_1 == 6
        if idx_1 == 1
          row.map!.with_index { |ele, idx_2| ele = Pawn.new(:B, self, self[[idx_1, idx_2]]) }
        else
          row.map!.with_index { |ele, idx_2| ele = Pawn.new(:W, self, self[[idx_1, idx_2]]) }
        end
      end
    end
  end

  def render
    system "clear"
    @rows.each { |row| p row } #puts "#{row.join(' ')}" }
  end

end

board = Board.new
# board.move_piece([3,3],[1,1])
# board.move_piece([0,8],[1,1])
# board.move_piece([0,0],[2,2])
board.render