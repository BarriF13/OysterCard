# first test
require "Oyster_card"
#step 11
#step 4
describe Oystercard do
  it "has money"do
    expect(subject.balance).to eq 0
  end
  #step 5 top up--I want to add money to my card
  describe '#top_up my card' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{subject.top_up 1}.to change{ subject.balance }.by 1
    end
    #I want a maximum limit (of £90) on my card after that give me an error
    it 'raise error if the maximum balance is exceeded' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE #assigning a constant var to a var
      subject.top_up(maximum_balance)
      expect {subject.top_up 1 }.to raise_error 'Maximum balance  of #{maximum_balance} exceeded'
    end
    it { is_expected.to respond_to(:deduct).with(1).argument }

    it 'deducts an amount from the balance'do
      subject.top_up(20)
      expect { subject.deduct 3}.to change{ subject.balance}.by -3
    end
    #I need to touch in and out. or we a re in journey
    it 'is initially not in a journey' do
      expect(subject.in_journey?).to eq false
    end
    it "can touch in" do
      subject.top_up(10)
      expect(subject.touch_in).to eq true
    end
    it "can touch out" do
      subject.top_up(10)
      subject.touch_in
      expect(subject.touch_out).to eq false
    end
    # step 9 -I need to have the minimum amount (£1) for a single journey.
    it "won't touch in if it's below minimum fare" do
      expect{ subject.touch_in }.to raise_error "Insufficient balance to touch in"
    end
    #When my journey is complete, I need the correct amount deducted from my card
    it "will charge the minimum fare" do
      subject.top_up(10)
      subject.touch_in
      expect { subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_CHARGE)
    end
  end

end
