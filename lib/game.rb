require_relative 'computer'
require_relative 'player'

class Game
  attr_reader :result, :player, :computer, :comp_choice, :player_choice, :turns, :rand_message
  attr_accessor :history, :comp_wins, :draws, :player_wins
  def initialize(player, computer = Computer.new)
    @player = player
    @player_choice 
    @computer = computer
    @comp_choice = []
    @comp_hands = [0,0,0]
    @player_hands = [0,0,0]
    @rand_message
    @result
    @history = []
    @comp_wins = 0
    @player_wins = 0
    @draws = 0
    @turns = 0
    @divisor = 1
  end
  

  def run_game 
    @comp_choice.push(@computer.play)
    if @comp_choice[-1] == @player.show
      @result = "It's A Draw"
      @draws += 1 
    elsif (@comp_choice[-1] == "Scissors" && @player.show == "Paper") || (@comp_choice[-1] == "Rock" && @player.show == "Scissors") || (@comp_choice[-1] == "Paper" && @player.show == "Rock")
      @result = "I Win."
      @comp_wins += 1 
    else
      @result = "You Win."
      @player_wins += 1 
    end
      @turns += 1# @history.push(@result)
  end
  

  # this is really just a design point now. use or trash
  def rand_messages
    msg = ["What Will You Choose, ", "Have You Made Your Pick, ", "Are You Ready To Decide, ", "What Will It Be This Time, ",
    "Are You Ready, ", "Have You Considered Your Choice Carefully, ", "Will This Be Your Victory, ", "Do You Think This Is A Good Move, "]
    @rand_message = msg.sample
  end
  
  # this is for dataviz, will be refactored later
  def divisor
    if (@turns / @divisor) >= 225
      @divisor *= 1.5
      divisor
    else
      @divisor
    end
  end
end


