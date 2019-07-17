require_relative "slideable"
require_relative 'piece'

class Rook < Piece
  include Slideable



  protected

    def move_dir
      horizontal_dirs
    end
end