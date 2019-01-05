class BowlingGame
  attr_reader :first_in_frame

  def initialize
    @first_in_frame = 0
  end

  def pins(rolls)
    @rolls = rolls
  end

  def score
    score = 0
    
    (0..9).each do |frame|
      if strike?
        score += 10 + bonus_for_strike
      elsif spare?
        score += 10 + bonus_for_spare
      else
        score += standard_frame_score
      end

      if strike?
        @first_in_frame += 1
      else
        @first_in_frame += 2
      end
    end
    score
  end

  private

  def standard_frame_score
    @rolls[first_in_frame] + @rolls[first_in_frame + 1]
  end

  def bonus_for_spare
    @rolls[first_in_frame + 2]
  end

  def bonus_for_strike
    @rolls[first_in_frame + 1] + @rolls[first_in_frame + 2]
  end

  def strike?
    @rolls[first_in_frame] == 10
  end

  def spare?
    standard_frame_score == 10
  end
end