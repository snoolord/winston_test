require 'colorize'
class Board


  def self.from_file
    @puzzle = File.readlines(ARGV[0]).map {|line| line.chomp.split("")}
    @puzzle.map! {|line| line.each_slice(3).to_a}
    @puzzle.map! do |line|
      line.map do |array|
        array.map do |tile|
          Tile.new(tile.to_i)
        end
      end
    end
    @puzzle
  end

  def initialize(grid)
    @grid = grid
  end

  def update_value(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def render
    puts "Current Board:"
    format_row = ''
    row_count = 0
    column_count = 0
    @grid.each do |row|
      row.each do |array|
        format_row << array.map {|tile| value_izer(tile)}.join('|') <<  "  "
        row_count+=1
        if row_count == 3
          puts format_row
          column_count+=1
          format_row = ''
          row_count = 0
        end
        if column_count == 3
          puts "\n"
          column_count = 0
        end
      end
    end
  end

  def solved?
    p check?(rows)
    p check?(columns)
    p check?(squares)

  end

  def value_izer(tile)
      if tile.blue
        tile.value.to_s.colorize(:light_blue)
      else
        :-
      end
  end

  def check?(arrays)
    arrays.all? {|row| row.sort == (1..9).to_a}
  end


  def squares
    squares = []
    square = []
    i = 0
    counter = 0
    until squares.length == 9
      @grid.each do |row|
          square << row[i].map {|tile| tile.value}
          counter +=1
          if counter == 3
            counter =0
            squares << square.flatten
            square = []
          end
      end
      i+=1
    end

    squares
  end

  def rows
    rows = []
    @grid.each do |row|
      rows << row.map do |array|
        array.map {|tile| tile.value}
      end.flatten
    end
    rows
  end

  def columns
    columns = []
    i = 0
    j = 0
    column = []
    until columns.length == 9
      @grid.each do |row|
        column << row[i][j].value
      end
      columns << column
      column = []
      j+=1
      if j==3
        j=0
        i+=1
      end
    end
    columns
  end

end
