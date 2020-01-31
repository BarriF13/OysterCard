class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 3
attr_reader :balance
  # def balance
  #   0
  # end
  def initialize
    @balance = 0
    @card_in_journey = false
  end

  def in_journey?
    @card_in_journey
  end
  def top_up(amount)
    raise 'Maximum balance  of #{maximum_balance} exceeded' if @balance + amount > MAXIMUM_BALANCE
    @balance = @balance + amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
        fail "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @card_in_journey = true

  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @card_in_journey =false
  end

end
