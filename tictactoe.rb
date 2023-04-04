class Player
  def initialize(player)
    @player = player
  end

end

class Game
  def initialize
    @board = Board.new
    @player = player
  end

#Starts the game loop
  def start
  end

#Gets the player move
  def get_move
  end

#Makes a a random move for the opponent
  def bot_move
  end

#Checks if any endgame conditions have been met (win, lose, tie)
  def check_round_end
  end
end

class Board
  def initialize
    @board = [["-","-","-"],["-","-","-"],["-","-","-"]]
  end

#Prints the current state of the board
  def display
  end

#Updates the board with the player's move
  def update
  end
end
