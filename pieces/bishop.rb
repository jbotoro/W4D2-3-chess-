require_relative "slideable"
require_relative 'piece'

class Bishop < Piece
  include Slideable

  protected

    def move_dir
      diagonal_dirs
    end
end