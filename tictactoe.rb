class Game
  attr_accessor :board

  def initialize
    @board = Board.new
    #@player = "X"
  end

#Starts the game loop
  def start
  end

#Gets the player move
  def get_move(column, row)
    
  end

#Makes a a random move for the opponent
  def bot_move
  end

#Checks if any endgame conditions have been met (win, lose, tie)
  def check_round_end
  end
end

class Board
  attr_accessor :board

  def initialize
    @board = [["-","-","-"],["-","-","-"],["-","-","-"]]
  end

#Prints the current state of the board
  def display
    for row in board do
        print row
        puts ""
    end
  end

#Updates the board with the players' move
  def update
  end
end

a = Game.new

a.board.display
