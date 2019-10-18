require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/game'
require './lib/turn'

class GameTest < Minitest::Test

  def setup
    @turn = Turn.new('bygg', 'bggr')
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_initialize
    assert_equal 'bygg', @turn.combo
    assert_equal 'rggb', @turn.guess
  end

  def test_correct
    assert_equal false, @turn.correct?
  end

  def test_correct_elements
    assert_equal 2, @turn.correct_elements
  end

  def test_correct_positions
    assert_equal 2, @turn.correct_positions
  end

end
