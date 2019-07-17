module Stepable



  def moves
    all_moves = []
    move_dirs.each do |dx, dy|
      all_moves.concat([self.pos.first + dx, self.pos.last + dy])
    end
    all_moves
  end
  
  private

  def move_diffs

  end

end