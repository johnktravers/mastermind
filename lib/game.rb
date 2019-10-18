class Game
  attr_reader :combo, :turns

  def initialize
    @combo = new_combo
    @turns = []
  end

  def new_combo
    'rrrrggggbbbbyyyy'.split('').sample(4).join('')
  end

  def start
    "Welcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
  end

  def play
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.\n\nWhat's your guess?\n> "
  end

  def instructions
    "Mastermind is a color combination-guessing game.\nEach game starts with a hidden color combo made up of one to four colors: (r)ed, (g)reen, (b)lue, and (y)ellow.\nTake turns guessing the combo in the format 'rygb' until you get it right!\n\n"
  end

  def prompt_turn
    "Please enter a guess for your next turn. You can also enter 'q' to quit.\n> "
  end

  def guess_too_short
    "Your guess is too short. Make sure it is four characters long.\n"
  end

  def guess_too_long
    "Your guess is too long. Make sure it is four characters long.\n"
  end

  def cheat
    "This game's secret code is #{@combo.upcase}. Try again next time.\n\n"
  end

end
