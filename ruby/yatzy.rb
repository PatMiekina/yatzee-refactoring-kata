# ALL METHODS TO HAVE THE SAME INPUT!
class Yatzy
  def initialize(d1, d2, d3, d4, d5)
    @dice = [0]*5 # create an array with 5 elements
    # reassign values of elements in the array
    @dice[0] = d1
    @dice[1] = d2
    @dice[2] = d3
    @dice[3] = d4
    @dice[4] = d5
  end
  
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

  def self.ones(d1,  d2,  d3,  d4,  d5)
    dice_scores = [d1, d2, d3, d4, d5]
    dice_scores.count(1)
    # [d1, d2, d3, d4, d5].count(1)
  end

  def self.twos(d1,  d2,  d3,  d4,  d5)
    dice_scores = [d1,  d2,  d3,  d4,  d5]
    dice_scores.count(2)*2
  end

  def self.threes(d1,  d2,  d3,  d4,  d5)
    dice_scores = [d1,  d2,  d3,  d4,  d5]
    dice_scores.count(3)*3
  end

  def self.fours(d1,  d2,  d3,  d4,  d5)
    [d1, d2, d3, d4, d5].count(4)*4
  end

  def self.fives(d1,  d2,  d3,  d4,  d5)
    [d1, d2, d3, d4, d5].count(5)*5
  end

  def self.sixes(d1,  d2,  d3,  d4,  d5)
    [d1, d2, d3, d4, d5].count(6)*6
  end

  def self.score_pair( d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    score = 0
    for i in 1..6 do
      score = 2 * i if dice.count(i) >= 2
    end
    score
  end

  def self.two_pair(d1,  d2,  d3,  d4,  d5)
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

  def self.smallStraight(d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    return 15 if dice.sort == (1..5).to_a
    0
  end

  def self.largeStraight(d1,  d2,  d3,  d4,  d5)
    dice = [d1, d2, d3, d4, d5]
    return 20 if dice.sort == (2..6).to_a
    0
  end

  def self.fullHouse(d1,  d2,  d3,  d4,  d5)
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
