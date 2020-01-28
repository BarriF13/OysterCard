require 'oyster_card'
describe OysterCard do
#--First error--uninitialized constant error--NameError:uninitialized constant OysterCard--./spec/oystercar_spec.rb:2:in `<top (required)>'
#------first story
# In order to use public transport
# As a customer
# I want money on my card
it 'I want money on my card, my card balance is zero' do
  expect(subject.balance).to eq(0)
end
# In order to keep using public transport
# As a customer
# I want to add money to my card
it 'I need to top up' do
  expect(subject).to respond_to(:top_up).with(1).argument
end
it ' It can top up the balance' do
  expect {subject.top_up 1}.to change{subject.balance }.by 1
end
# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of £90) on my card
it 'Maximum balance is exceeded'do
  maximum_balance = OysterCard::MAX_TOP
  subject.top_up maximum_balance
  expect{ subject.top_up 1}.to raise_error("Maximum balance of #{maximum_balance} exceeded")
end
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
it 'fare is deducted from my card' do
  expect(subject).to respond_to(:deduct).with(1).argument
end
it ' It can deduct the fare' do
  subject.top_up(20)
  expect {subject.deduct 1}.to change{subject.balance }.by -1
end
# In order to get through the barriers.
# As a customer
# I need to touch in and out.
it "is initially not in a journey" do
  expect(subject).not_to be_in_journey
end
it "can touch in" do
  subject.touch_in
  expect(subject).to be_in_journey
end
it "can touch out" do
  subject.touch_in
  subject.touch_out
  expect(subject).not_to be_in_journey
end
end
