# first test
require "Oyster_card"
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
    it { is_expected.to respond_to(:deduct).with(1).argument}
  end
end
