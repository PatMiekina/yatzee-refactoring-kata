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
    total = 0
    total += d1
    total += d2
    total += d3
    total += d4
    total += d5
    return total
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

  def self.two_pair( d1,  d2,  d3,  d4,  d5)
    counts = [0]*6
    counts[d1-1] += 1
    counts[d2-1] += 1
    counts[d3-1] += 1
    counts[d4-1] += 1
    counts[d5-1] += 1
    n = 0
    score = 0
    for i in Array 0..5
      if (counts[6-i-1] >= 2)
        n = n+1
        score += (6-i)
      end
    end
    if (n == 2)
      return score * 2
    else
      return 0
    end
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
    t = [0]*6
    t[d1-1] += 1
    t[d2-1] += 1
    t[d3-1] += 1
    t[d4-1] += 1
    t[d5-1] += 1
    for i in [0,1,2,3,4,5]
      if (t[i] >= 3)
        return (i+1) * 3
      end
    end
    0
  end

  def self.smallStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    (tallies[0] == 1 and
      tallies[1] == 1 and
      tallies[2] == 1 and
      tallies[3] == 1 and
      tallies[4] == 1) ? 15 : 0
  end

  def self.largeStraight( d1,  d2,  d3,  d4,  d5)
    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1
    if (tallies[1] == 1 and tallies[2] == 1 and tallies[3] == 1 and tallies[4] == 1 and tallies[5] == 1)
      return 20
    end
    return 0
  end

  def self.fullHouse( d1,  d2,  d3,  d4,  d5)
    tallies = []
    _2 = false
    i = 0
    _2_at = 0
    _3 = false
    _3_at = 0

    tallies = [0]*6
    tallies[d1-1] += 1
    tallies[d2-1] += 1
    tallies[d3-1] += 1
    tallies[d4-1] += 1
    tallies[d5-1] += 1

    for i in Array 0..5
      if (tallies[i] == 2)
        _2 = true
        _2_at = i+1
      end
    end

    for i in Array 0..5
      if (tallies[i] == 3)
        _3 = true
        _3_at = i+1
      end
    end

    if (_2 and _3)
      return _2_at * 2 + _3_at * 3
    else
      return 0
    end
  end
end
