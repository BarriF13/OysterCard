
# write a class to solve the first error

class OysterCard
  MAX_TOP = 90
  MIN_BALANCE = 10
  MIN_CHARGE = 1

  attr_reader :balance ,:card_in_journey, :fare
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

  def touch_in
    fail "required #{MIN_BALANCE} for your journey" if @balance < MIN_BALANCE
    @card_in_journey = true
  end

  def touch_out
    @card_in_journey = false
    deduct(MIN_CHARGE)
  end

  def deduct(fare)
    @balance -= fare
  end

end
