class Game
  attr_accessor :p_move, :board

  def initialize
    @board = Board.new(self)
    @p_move = []
  end

#Starts the game loop
  def start
    @board.display
    loop do
      get_move
      @board.update(@p_move)
      break if check_round_end
    end
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
    
    #@board.bot_move(@b_move)
  end

#Checks if any endgame conditions have been met (win, lose, tie)
  def check_round_end
    if win?("X")
      puts "You win!"
      return true
    elsif win?("O")
      puts "The bot wins D:"
      return true
    elsif tie?
      puts "It's a tie!"
      return true
    else
      puts "Keep going!"
      return false
    end
  end
  

  private

  def win?(player)
    #Checks rows
    (1..3).each do |row|
      if @board.board[row][1..3].all? {|cell| cell == player}
        return true
      end
    end

    #Checks columns
    (1..3).each do |col|
      if [@board.board[1][col], @board.board[2][col], @board.board[3][col]].all? { |cell| cell == player }
        return true
      end
    end

    #Checks diagonals
    if [@board.board[1][1], @board.board[2][2], @board.board[3][3]].all? { |cell| cell == player }
      return true
    elsif [@board.board[1][3], @board.board[2][2], @board.board[3][1]].all? { |cell| cell == player }
      return true
    end

    return false
  end

  def tie?
    #Check if all cells are filled
    if @board.board.flatten.none? { |cell| cell == "-" }
        return true
    end
  end
end

class Board

  attr_accessor :board, :game, :b_move 

  def initialize(game)
    @board = [
        ["0", "1", "2", "3"],
        ["1", "-","-","-"],
        ["2", "-","-","-"],
        ["3", "-","-","-"]
    ]
    @game = game
    @b_move = []
  end

#Prints the current state of the board
  def display
    @board.each do |row|
      puts row.join(' ')
    end
  end

#Updates the board with the players' move
  def update(p_move)
    @board[p_move[0]][p_move[1]] = "X"
    bot_move(@b_move)
    display
  end

  def bot_move(b_move)
    loop do
      2.times do |index|
        b_move[index] = rand(1..3)
      end
      
      break if @board[b_move[0]][b_move[1]] == "-"
    end
    @board[b_move[0]][b_move[1]] = "O"
  end

end

tictactoe = Game.new
tictactoe.start  