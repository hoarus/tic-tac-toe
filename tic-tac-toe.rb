class Board

  attr_reader :game_over, :gamesquares, :continue_playing

  def initialize ()
    @name = "gameboard"
    @turn = 0
    @gamesquares = [
      [" 1 ", " 2 ", " 3 "],
      [" 4 ", " 5 ", " 6 "],
      [" 7 ", " 8 ", " 9 "],
    ]
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
      |#{@gamesquares[0][0]}|#{@gamesquares[0][1]}|#{@gamesquares[0][2]}|
      =============
      |#{@gamesquares[1][0]}|#{@gamesquares[1][1]}|#{@gamesquares[1][2]}|
      =============
      |#{@gamesquares[2][0]}|#{@gamesquares[2][1]}|#{@gamesquares[2][2]}|
      =============
    "
  end

  def play_game
    loop do
      while @game_over == false
        game_turn
      end
      if play_again? == false
        break
      end
    end
  end

  def game_turn
    @turn += 1
    puts "Turn #{@turn}."
    draw_board
    player = @turn.odd? ? @players[0] : @players[1]
    puts "#{player.name}, it is your turn."
    token = " #{player.token} "
    puts "\nPlease input the space on the board where you would like to place your token."
    valid_input = false
    while valid_input == false
      input = gets.chomp.downcase.strip
      @gamesquares.each do |row|
        square_index = 0
        row.each do |square|
          if square.strip == input
            row[square_index] = token
            valid_input = true
          end
          square_index += 1
        end
      end
      if valid_input == false
        puts "Invalid input. Please try again:"
      end
    end
    draw_board
    check_for_win(player, token) 
  end
    
  def check_for_win(player, token)
    if win_condition_1(token) || win_condition_2(token) || win_condition_3(token)
      puts "Congratulations #{player.name}, you have won the game!"
      @game_over = true
    elsif @turn == 9
      puts "The game is a draw!"
      @game_over = true
    end
  end

  def win_condition_1(token)
    @gamesquares.any? do |row|
      row.all? { |square| square == token}
    end
  end

  def win_condition_2(token)
    if @gamesquares.all? { |row| row[0] == token}
      true
    elsif @gamesquares.all? { |row| row[1] == token}
      true
    elsif @gamesquares.all? { |row| row[2] == token}
      true
    else
      false
    end
  end

  def win_condition_3(token)
    if @gamesquares[1][1] == token
      if @gamesquares[0][0] == token && @gamesquares[2][2] == token
        true
      elsif @gamesquares[0][2] == token && @gamesquares[2][0] == token
        true
      end
    end
  end

  def play_again?
    puts "Would you like to play again?"
    response = gets.chomp.downcase().strip
    if ["y", "yes", "yeah", "yep"].include? response
      @game_over = false
      reset_board
      puts "\nNew Game!\n"
      true
    else
      puts "\nThanks for playing!"
      false
    end
  end
  
  def reset_board
    @gamesquares = [
      [" 1 ", " 2 ", " 3 "],
      [" 4 ", " 5 ", " 6 "],
      [" 7 ", " 8 ", " 9 "],
    ]
    @turn = 0
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

# Welcome message to Tic-Tac-Toe
puts "Welcome to a game of Tic-Tac-Toe!"
gameboard = Board.new()

# Initialize players
puts "\nPlayer One, what is your name?"
player1 = Player.new(1, gets.chomp, "X")
gameboard.add_player(player1)
puts "\n#{player1.name}, you will be using the #{player1.token} token."
puts "\nPlayer Two, what is your name?"
player2 = Player.new(2, gets.chomp, "O")
gameboard.add_player(player2)
puts "\n#{player2.name}, you will be using the #{player2.token} token."

gameboard.play_game
