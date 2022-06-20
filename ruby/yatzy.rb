# ALL METHODS TO HAVE THE SAME INPUT!
class Yatzy
  
  def self.chance(d1, d2, d3, d4, d5)
    [d1, d2, d3, d4, d5].sum
  end

  def self.yatzy(d1, d2, d3, d4, d5)
    dice = [d1, d2, d3, d4, d5]
    score = 0
    for i in 1..6 do
        score = 50 if dice.count(i) == 5
    end
    score
  end

  def self.single_dice(dice_set, dice)
    dice_set.count(dice) * dice
  end

  def self.pair( d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    score = 0
    for i in 1..6 do
      score = 2 * i if dice.count(i) >= 2
    end
    score
  end

  def self.four_of_a_kind(d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    score = 0
    for i in 1..6 do
      score = 4 * i if dice.count(i) >= 4
    end
    score
  end

  def self.three_of_a_kind( d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    score = 0
    for i in 1..6 do
      score = 3 * i if dice.count(i) >= 3
    end
    score
  end

  def self.two_pairs(d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    for i in 1..6 do
      pair1 = i if dice.count(i) >= 2
    end
    2.times {dice.delete(pair1)}
    for i in 1..6 do
      pair2 = i if dice.count(i) >= 2
    end
    pair1 != 0 && pair2 != 0 ? 2 * pair1 + 2 * pair2 : 0
  end

  def self.small_straight(d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    return 15 if dice.sort == (1..5).to_a
    0
  end

  def self.large_straight(d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    return 20 if dice.sort == (2..6).to_a
    0
  end

  def self.full_house(d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    three = 0
    pair = 0
    for i in 1..6 do
    three = i if dice.count(i) >= 3
    end
    3.times {dice.delete(three)} if three
    for i in 1..6 do
    pair = i if dice.count(i) >= 2
    end
    three && pair ? 3 * three + 2 * pair : 0
end
end
