require_relative 'yatzy'
require 'test/unit'

# ALL METHODS TO HAVE THE SAME INPUT!
class YatzyTest < Test::Unit::TestCase
  def test_chance
    expected = 15
    actual = Yatzy.chance(2,3,4,5,1)
    assert expected == actual
    assert 16 == Yatzy.chance(3,3,4,5,1)
  end

  def test_yatzy 
    expected = 50
    actual = Yatzy.yatzy(4,4,4,4,4)
    assert expected == actual
    assert 50 == Yatzy.yatzy(6,6,6,6,6)
    assert 0 == Yatzy.yatzy(6,6,6,6,3)
  end
 
  def test_single_dice
    assert Yatzy.single_dice(1,2,3,4,5, 1) == 1
    assert 2 == Yatzy.single_dice(1,2,1,4,5, 1)
    assert 0 == Yatzy.single_dice(6,2,2,4,5, 1)
    assert 4 == Yatzy.single_dice(1,2,1,1,1, 1)
    assert Yatzy.single_dice(1,2,3,2,6, 2) == 4
    assert Yatzy.single_dice(2,2,2,2,2, 2) == 10
  end

  def test_one_pair
    assert 6 == Yatzy.pair(3,4,3,5,6)
    assert 10 == Yatzy.pair(5,3,3,3,5)
    assert 12 == Yatzy.pair(5,3,6,6,5)
  end

  def test_two_pairs
    assert_equal 16, Yatzy.two_pairs(3,3,5,4,5)
    assert_equal 16, Yatzy.two_pairs(3,3,5,5,5)
  end

  def test_three_of_a_kind
    assert 9 == Yatzy.three_of_a_kind(3,3,3,4,5)
    assert 15 == Yatzy.three_of_a_kind(5,3,5,4,5)
    assert 9 == Yatzy.three_of_a_kind(3,3,3,3,5)
  end

  def test_four_of_a_kind
    assert 12 == Yatzy.four_of_a_kind(3,3,3,3,5)
    assert 20 == Yatzy.four_of_a_kind(5,5,5,4,5)
    assert 9 == Yatzy.three_of_a_kind(3,3,3,3,3)
    assert 12 == Yatzy.four_of_a_kind(3,3,3,3,3)
  end

  def test_small_straight
    assert 15 == Yatzy.straight(1,2,3,4,5, "S")
    assert 15 == Yatzy.straight(2,3,4,5,1, "S")
    assert 0 == Yatzy.straight(1,2,2,4,5, "S")
  end

  def test_large_straight
    assert 20 == Yatzy.straight(6,2,3,4,5, "L")
    assert 20 == Yatzy.straight(2,3,4,5,6, "L")
    assert 0 == Yatzy.straight(1,2,2,4,5, "L")
  end

  def test_full_house
    assert 18 == Yatzy.full_house(6,2,2,2,6)
    assert 0 == Yatzy.full_house(2,3,4,5,6)
  end
end
