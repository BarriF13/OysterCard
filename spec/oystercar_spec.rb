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

end
