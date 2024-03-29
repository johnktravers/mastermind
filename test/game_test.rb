require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/game'
require './lib/turn'

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

  def test_add_turn
    @game.add_turn('bgrr')

    assert_equal 1, @game.turns.length
    assert_instance_of Turn, @game.turns.first

    @game.add_turn('ryby')

    assert_equal 2, @game.turns.length
  end

  def test_check_guess
    @game.turns << Turn.new('yybg', 'rrgb')

    assert_equal false, @game.check_guess

    @game.turns << Turn.new('yybg', 'yybg')

    assert_equal true, @game.check_guess
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

  def test_prompt_turn
    expected = "Please enter a guess for your next turn. You can also enter 'q' to quit.\n> "
    assert_equal expected, @game.prompt_turn
  end

  def test_guess_too_short
    expected = "Your guess is too short. Make sure it is four characters long.\n"
    assert_equal expected, @game.guess_too_short
  end

  def test_guess_too_long
    expected = "Your guess is too long. Make sure it is four characters long.\n"
    assert_equal expected, @game.guess_too_long
  end

  def test_cheat
    @game.expects(:combo).returns('bgyy')
    expected = "This game's secret code is BGYY. Try again next time.\n\n"
    assert_equal expected, @game.cheat
  end

  def test_incorrect_feedback
    @game.turns << Turn.new('yygb', 'rrgb')
    expected = "RRGB has 2 of the correct elements with 2 in the correct positions\nYou've taken 1 guess(es)."
  end

end
