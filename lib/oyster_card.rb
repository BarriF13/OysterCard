class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 3
attr_reader :balance, :entry_station, :exit_station
  # def balance
  #   0
  # end
  def initialize
    @balance = 0
    @card_in_journey = false
    @entry_station = nil
    @exit_station = nil
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

  def touch_in(station)
        fail "Insufficient balance to touch in" if @balance < MINIMUM_BALANCE
    @entry_station = station
    @card_in_journey = true
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @exit_station = station
    @card_in_journey =false
  end

end
