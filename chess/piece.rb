module Slideable

end

module Stepable

end

class Piece
  attr_reader :color, :board
  attr_accessor :pos



  def initialize(color, board, pos)
    @color = color
    @board  = board
    @pos = pos
  end

  def moves
    possible_moves = []
  end

  def to_s
    self.
  end

  def empty?
  
  end

end