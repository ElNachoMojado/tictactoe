class Game
  attr_accessor :board, :p_move, :player, :b_move

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
      @p_move[index] = number
    end 
    puts '' 
  end

#Makes a a random move for the opponent
  def bot_move
    loop do
      2.times do |index|
        @b_move[index] = rand(1..3)
      end
      break if @board[@b_move[0]][@b_move[1]] == "-"
    end
  end

#Checks if any endgame conditions have been met (win, lose, tie)
  def check_round_end
  end
end

class Board

  attr_accessor :board

  def initialize
    @board = [['@', 1, 2, 3],[1, "-","-","-"],[2, "-","-","-"],[3, "-","-","-"]]
  end

#Prints the current state of the board
  def display
    @board.each do |row|
      puts row.join(' ')
    end
  end

#Updates the board with the players' move
  def update(instance_of_Game)
    @board[instance_of_Game.p_move[0]][instance_of_Game.p_move[1]] = instance_of_Game.player
    instance_of_Game.board = @board
    instance_of_Game.bot_move
    @board[instance_of_Game.b_move[0]][instance_of_Game.b_move[1]] = "O"
    instance_of_Game.board = @board
    display
  end
end

a = Game.new
b = Board.new

a.board.display
a.get_move
b.update(a)
#a.bot_move
