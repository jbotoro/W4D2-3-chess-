require_relative 'stepable'
require_relative 'piece'
  
class King < Piece
  include Stepable

  protected 

  def move_diffs
    moves = [
      [-1,0],
      [-1,-1],
      [-1,1],
      [0,1],
      [0,-1],
      [1,0],
      [1,1],
      [1,-1]
    ]
  end

end