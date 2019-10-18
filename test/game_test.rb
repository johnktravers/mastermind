require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/game'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
  end

  def test_it_exists
    assert_instance_of Game, @game
  end

  def test_initialize
    assert_equal 4, @game.combo.length
    assert_equal [], @game.turns
  end

  def test_new_combo
    assert_equal true, @game.new_combo.match?(/[rybg]/)
    assert_equal 4, @game.new_combo.length
  end

  def test_start
    expected = "Welcome to MASTERMIND\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
    assert_equal expected, @game.start
  end

  def test_play
    expected = "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow.\nUse (q)uit at any time to end the game.\n\nWhat's your guess?\n> "
    assert_equal expected, @game.play
  end

  def test_instructions
    expected = "Mastermind is a color combination-guessing game.\nEach game starts with a hidden color combo made up of one to four colors: (r)ed, (g)reen, (b)lue, and (y)ellow.\nTake turns guessing the combo in the format 'rygb' until you get it right!\n\n"
    assert_equal expected, @game.instructions
  end

end
