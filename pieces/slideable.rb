module Slideable

  private

  HORIZONTAL_DIRS = [
    up = [-1, 0],
    down = [1,0],
    left = [0, -1],
    right = [0, 1]
  ]

  DIAG_DIRS = [
    up_r = [-1, 1],
    up_l = [-1, -1],
    down_r = [1, 1],
    down_l = [1, -1]
  ]

  public

  def horizontal_dirs 
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAG_DIRS
  end

  def moves
    all_moves = []
    move_dirs.each do |dx, dy|
      all_moves.concat(grow_unblocked_moves_in_dir(dx, dy))
    end
    all_moves
  end

  private

  def move_dirs

  end

  def grow_unblocked_moves_in_dir(dx, dy)
    unblocked = []

    curr_pos = self.pos
    blocked = false
    until blocked
      curr_pos = [curr_pos.first + dx, curr_pos.last + dy]
      new_pos = self.board[curr_pos]
      unblocked << curr_pos if new_pos.nil? # should be null piece
      if new_pos.color == self.color
        blocked = true
      else
        unblocked << curr_pos
        blocked = true
      end
    end

    unblocked
  end

end