require "slideable"

class Rook < Piece
  include Slideable



  protected

    def move_dir
      horizontal_dirs
    end
end