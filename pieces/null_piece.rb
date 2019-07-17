require 'singleton'
require_relative 'piece'

class NullPiece < Piece

  include Singleton

  def initialize
  end

  def moves
  end

  def symbol
    self.color
  end

  def inspect
    self.symbol
  end

end