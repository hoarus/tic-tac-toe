#We should make the gamesquares a nested array
# label them 1,2,3
# Enable spellcheck
#solve win condition 2
#make game repeatable

class Board
  attr_reader :game_over
  def initialize ()
    @name = "gameboard"
    #@a1 = "a-1"
    #@a2 = "a-2"
    #@a3 = "a-3"
    #@b1 = "b-1"
    #@b2 = "b-2"
    #@b3 = "b-3"
    #@c1 = "c-1"
    #@c2 = "c-2"
    #@c3 = "c-3"
    @turn = 0
    @gamesquares = {
      row_a: {
        a1: "a-1",
        a2: "a-2",
        a3: "a-3",
      },
      row_b: {
        b1: "b-1",
        b2: "b-2",
        b3: "b-3",
      },
      row_c: {
        c1: "c-1",
        c2: "c-2",
        c3: "c-3",
      }
    }
    @players = []
    @game_over = false
  end

  def add_player (player)
    @players << player
    player.board = self
  end

  def draw_board
  puts "
    =============
    |#{@gamesquares[:row_a][:a1]}|#{@gamesquares[:row_a][:a2]}|#{@gamesquares[:row_a][:a3]}|
    =============
    |#{@gamesquares[:row_b][:b1]}|#{@gamesquares[:row_b][:b2]}|#{@gamesquares[:row_b][:b3]}|
    =============
    |#{@gamesquares[:row_c][:c1]}|#{@gamesquares[:row_c][:c2]}|#{@gamesquares[:row_c][:c3]}|
    =============
    "
  end

  def game_turn
    @turn += 1
    puts "Turn #{@turn}."
    draw_board
    @turn.odd? ? player = @players[0] : player = @players[1]
    puts "#{player.name}, it is your turn."
    token = " #{player.token} "
    puts "\nPlease input the space on the board where you would like to place your token."
    puts "For example, if you wanted to select the bottom-right space, you would input \"c-3\"."
    valid_input = false
    while valid_input == false do
      input = gets.chomp.downcase().delete "-"
      @gamesquares.each do |row, squares|
        squares.each do |square, value|
          if value.delete("-") == input
            squares[square] = token
            valid_input = true
          end
        end
      end
      if valid_input == false
        puts "Invalid input. Please try again:"
      end
    end
    draw_board
    check_for_win(player, token) 
  end
    
  def check_for_win (player, token)
    #check all win conditions
      #if Win condition 1, 2 or 3
      #that way, stops as soon as anything is true

    #win condition 2
    #all of column 1, 2 or 3

    #win condition 3
    #centre piece and
      #a-1 & c3
      #c-1 & a-3
    if win_condition_1(token) || win_condition_3(token)
      puts "Congratulations #{player.name}, you have won the game!"
      @game_over = true
    elsif win_condition_3(token)
      puts "something"
    end
    #return if game_over
    #game_over = @gamesquares
  end

  def win_condition_1 (token)
    return @gamesquares.any? do |rows, squares|
      squares.all? {|square, value | value == token}
    end
  end

  def win_condition_3 (token)
    if @gamesquares[:row_b][:b2] == token
      if @gamesquares[:row_a][:a1] == token && @gamesquares[:row_c][:c3] == token
        return true
      elsif @gamesquares[:row_c][:c1] == token && @gamesquares[:row_a][:a1] == token
        return true
      end
    end
  end


end

class Player
  attr_reader :order, :name, :token
  attr_accessor :board

  @@all = []
  
  def initialize(order, name, token)
    @order = order
    @name = name
    @token = token
    @@all << self
  end

end

#Welcome message to Tic-Tac-Toe
puts "Welcome to a game of Tic-Tac-Toe!"
gameboard = Board.new()

#Initialize players
puts "\nPlayer One, what is your name?"
player1 = Player.new(1, gets.chomp, "X")
gameboard.add_player(player1)
puts "\n#{player1.name}, you will be using the #{player1.token} token."
puts "\nPlayer Two, what is your name?"
player2 = Player.new(2, gets.chomp, "O")
gameboard.add_player(player2)
puts "\n#{player2.name}, you will be using the #{player2.token} token."

#Turn One
while gameboard.game_over == false do
gameboard.game_turn
end



#2 players
  #class Players
  #Instantiate Player 1 & Player 2
  #gets Player Name (player 1 is x)







  #class Board
  #label squares (e.g. a-1)
  #Have the squares be variables
  #The player can select the square
  #The variable is then replaced by their board


#Each round will determine
  #Who's turn is it?
    #Have a player variable that changes at the end of each round
  #Ask appropriate player to input the square they wish to move to
  #Replace that variable with their token
  #Check for win-condition
    #Have variables in a nested array
      #if one entire column is X or O, win
      #if one entire row is X or 0 win
      #If centre piece and relevant diagonals are same - win

#End of game
  #If win, congratulate player
  #If draw, prompt Draw and play again