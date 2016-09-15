require 'colorize'
class Tile

  attr_accessor :value, :blue

  def initialize(value)
    @value = value
    if value > 0
      @blue = true
    else
      @blue = false
    end
  end

  def to_s

  end
end
