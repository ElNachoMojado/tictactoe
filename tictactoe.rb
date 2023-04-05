class Game
  attr_accessor :board, :p_move, :player

  def initialize
    @board = Board.new
    @player = "X"
    @bot = "O"
    @p_move = []
    @b_move = []
  end

#Starts the game loop
  def start
  end

#Gets the player move
  def get_move
    number = 0
    puts "Where are you placing your next mark?"
    2.times do |index|
      if index == 0 
        puts "Enter row number"
      else 
        puts "Enter column number"
      end
      loop do
        number = gets.to_i
        break if number > 0 && number <=3
      end
      @p_move[index] = number - 1
    end  
    p @p_move
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
    for row in @board do
        p row
    end
  end

#Updates the board with the players' move
  def update(instance_of_Game)
    @board[instance_of_Game.p_move[0]][instance_of_Game.p_move[1]] = instance_of_Game.player
    instance_of_Game.board = @board
  end
end

a = Game.new
b = Board.new

a.board.display
a.get_move
b.update(a)
a.board.display
