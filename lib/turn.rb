class Turn
  attr_reader :combo, :guess

  def initialize(combo, guess)
    @combo = combo
    @guess = guess
  end

  def correct?
    @combo == @guess
  end

  def correct_elements
    combo_chars = @combo.split('').uniq
    guess_chars = @guess.split('').uniq
    (combo_chars & guess_chars).length
  end

  def correct_positions
    combo_arr = @combo.split('')
    guess_arr = @guess.split('')

    combo_arr.zip(guess_arr).count do |combo_char, guess_char|
      combo_char == guess_char
    end
  end

end
