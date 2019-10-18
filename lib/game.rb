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


end
