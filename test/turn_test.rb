require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class TurnTest < Minitest::Test

  def setup
    @turn_1 = Turn.new('bygg', 'bggr')
    @turn_2 = Turn.new('rybr', 'gyyb')
  end

  def test_it_exists
    assert_instance_of Turn, @turn_1
  end

  def test_initialize
    assert_equal 'bygg', @turn_1.combo
    assert_equal 'bggr', @turn_1.guess
  end

  def test_correct
    assert_equal false, @turn_1.correct?
    assert_equal false, @turn_2.correct?
  end

  def test_correct_elements
    assert_equal 2, @turn_1.correct_elements
    assert_equal 2, @turn_2.correct_elements
  end

  def test_correct_positions
    assert_equal 2, @turn_1.correct_positions
    assert_equal 1, @turn_2.correct_positions
  end

end
