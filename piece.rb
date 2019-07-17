class Piece
  attr_reader :color, :board
  attr_accessor :pos



  def initialize(color, board, pos)
    @color = color
    @board  = board
    @pos = board[pos]
  end

  def moves
    possible_moves = []
  end

  def symbol
    puts "#{color} #{self.class.name}"
  end

  def to_s
    self.symbol
  end

  def empty?
  
  end

end