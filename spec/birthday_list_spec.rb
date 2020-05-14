require 'birthday_list.rb'

describe Friend do
  subject {Friend.new}

  it 'responds to add_friend method' do
    expect(subject).to respond_to(:add_freind).with(3).arguments
  end

  it 'can hold multiple friends' do
    subject.add_freind("Jane", "1 January", 24)
    subject.add_freind("Tim", "31 January", 12)
    expect(subject.instance_variable_get(:@friends)).to eq([{name: "Jane", birthday: "1 January", age: 24}, {name: "Tim", birthday: "31 January", age: 12}])
  end

  it 'puts friends on a line each with all details when requested' do
    subject.add_freind("Jane", "1 January", 24)
    subject.add_freind("Tim", "31 January", 12)
    expect{subject.show_all}.to output("Jane: 1 January\nTim: 31 January\n").to_stdout
  end

end
