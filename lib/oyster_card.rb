
# write a class to solve the first error
class OysterCard
  attr_reader :balance
  def initialize()
    @balance = 0
  end

  def top_up(credit)
    @balance = @balance + credit
  end
end
