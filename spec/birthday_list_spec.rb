require 'birthday_list.rb'

describe Birthday_list do
  subject {Birthday_list.new}

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

  it 'can tell what date today is' do
    expect(subject.today).to eq(Time.new.strftime("%d %b"))
  end

  it 'outputs a string when it is someones birthday' do
    subject.add_freind("Jane", "1 January", 24)
    allow(subject).to receive(:today) {"1 January"}
    expect{subject.birthday_today?}.to output("It's Jane's birthday today! They are 25 years old!\n").to_stdout
  end

  it 'updates age when its their birthday' do

  end 


end
