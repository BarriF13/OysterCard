require 'oyster_card'
describe OysterCard do
#   In order to pay for my journey
# As a customer
# I need to know where I've travelled from
let(:station_white_chapel){double "white chapel"}
let(:station_mansion_house){double "mansion house"}

it 'stores the entry station' do
  subject.touch_in("white chapel")
  expect(subject.entry_station).to eq "white chapel"
end
# In order to know where I have been
# As a customer
# I want to see all my previous trips

it 'stores the entry station' do
  subject.touch_out("mansion house")
  expect(subject.exit_station).to eq "mansion house"
end
end
