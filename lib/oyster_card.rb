
# write a class to solve the first error

class OysterCard
  MAX_TOP = 90

  attr_reader :balance ,:card_in_journey
  def initialize()
    @balance = 0
    @fare = 0
    @card_in_journey = false
  end

  def in_journey?
    @card_in_journey
  end

  def top_up(credit)

    raise "Maximum balance of #{MAX_TOP} exceeded" if( @balance + credit) > MAX_TOP
    @balance += credit
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @card_in_journey = true
  end
  def touch_out
    @card_in_journey = false
  end

end
