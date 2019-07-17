require_relative "slideable"
require_relative 'piece'

class Queen < Piece
  include Slideable

  protected

    def move_dir
      horizontal_dirs.concat(self.diagonal_dirs)
    end
end