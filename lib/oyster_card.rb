
# write a class to solve the first error

class OysterCard
  MAX_TOP = 90
  MIN_BALANCE = 10
  MIN_CHARGE = 1

  attr_reader :balance ,:card_in_journey, :fare, :entry_station, :exit_station, :saved_journeys
  def initialize()
    @balance = 15
    @fare = 0
    @card_in_journey = false
    @entry_station = nil
    @saved_journeys = {}
    @exit_station = nil
  end

  def in_journey?
    !!entry_station
  end

  def top_up(credit)

    raise "Maximum balance of #{MAX_TOP} exceeded" if( @balance + credit) > MAX_TOP
    @balance += credit
  end

  def touch_in(station)
    fail "required #{MIN_BALANCE} for your journey" if @balance < MIN_BALANCE
    @card_in_journey = true
    @entry_station = station
  end

  def touch_out(station)
    @card_in_journey = false
    deduct(MIN_CHARGE)
    @exit_station = station
  end

  def deduct(fare)
    @balance -= fare
  end
end
