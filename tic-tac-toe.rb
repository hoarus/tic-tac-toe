class Board
  
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
    if @turn.odd?
      puts "#{@players[0].name}, it is your turn."
      puts "\nPlease input the space on the board where you would like to place your token."
      puts "For example, if you wanted to select the bottom-right space, you would input \"c-3\"."
      input = gets.chomp.downcase().delete "-"
      puts @gamesquares[:a1]
      #Check if input matches any of the board variables)
      
    end
  end


end

class Player
  attr_reader :order, :name, :token
  attr_accessor :board

  @@all = []
  
  def initialize(order, name,token)
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
gameboard.game_turn



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