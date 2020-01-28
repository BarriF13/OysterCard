
# write a class to solve the first error

class OysterCard
  MAX_TOP = 90

  attr_reader :balance
  def initialize()
    @balance = 0
  end

  def top_up(credit)
    raise "Maximum balance is exceeded" if( @balance + credit) > MAX_TOP
    @balance += credit
  end
end
