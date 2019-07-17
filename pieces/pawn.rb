require_relative 'piece'

class Pawn < Piece

  private

  def at_start_row?
    if self.color == :B
      self.pos.first == 1
    else
      self.pos.first == 6
    end
  end

  def forward_dir
    return 1 if self.color == :B
    -1
  end
 
  def forward_steps

  end

end