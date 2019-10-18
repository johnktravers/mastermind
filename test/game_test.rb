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

  def prompt_turn
    expected = "Please enter a guess for your next turn. You can also enter 'q' to quit.\n> "
    assert_equal expected, @game.prompt_turn
  end

  def guess_too_short
    expected = "Your guess is too short. Make sure it is four characters long.\n"
    assert_equal expected, @game.prompt_turn
  end

  def guess_too_long
    expected = "Your guess is too long. Make sure it is four characters long.\n"
    assert_equal expected, @game.prompt_turn
  end

  def cheat
    @game.stubs(:combo).expects('BGYY')
    expected = "This game's secret code is #{@game.combo.upcase}. Try again next time.\n\n"
    assert_equal expected, @game.cheat
  end

end
