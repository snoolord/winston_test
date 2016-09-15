require_relative 'tile'
require_relative 'board'

class Sudoku

  def initialize(board)
    @board = board
  end

  def play
    @board.solved?
  end


end



if __FILE__ == $PROGRAM_NAME
  puzzle = Board.from_file
  starting_board = Board.new(puzzle)
  starting_board.render
  sudoku = Sudoku.new(starting_board)
  sudoku.play
end
