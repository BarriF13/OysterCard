class Oystercard
  MAXIMUM_BALANCE = 90
attr_reader :balance
  # def balance
  #   0
  # end
  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise 'Maximum balance  of #{maximum_balance} exceeded' if @balance + amount > MAXIMUM_BALANCE
    @balance = @balance + amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
