require 'birthday_list.rb'
require 'timecop'

describe Birthday_list do
  subject {Birthday_list.new}

  before :each do
    subject.add_freind("Jane", "01 January", 24)
    subject.add_freind("Tim", "31 January", 12)
  end

  it 'responds to add_friend method' do
    expect(subject).to respond_to(:add_freind).with(3).arguments
  end

  it 'can hold new friends' do
    subject.add_freind("Test", "1 May", 72)
    expect(subject.instance_variable_get(:@friends)).to include({name: "Test", birthday: "1 May", age: 72})
  end

  it 'can hold multiple friends' do
    expect(subject.instance_variable_get(:@friends)).to include({name: "Jane", birthday: "01 January", age: 24}, {name: "Tim", birthday: "31 January", age: 12})
  end

  it 'puts friends on a line each with all details when requested' do
    expect{subject.show_all}.to output("Jane: 01 January\nTim: 31 January\n").to_stdout
  end

  it 'can tell what date today is' do
    expect(subject.today).to eq(Time.new.strftime("%d %b"))
  end

  it 'outputs a string when it is someones birthday' do
    Timecop.freeze(Time.parse('01 January 2000')) do
      expect{subject.birthday_today?}.to output("It's Jane's birthday today! They are 25 years old!\n").to_stdout
    end
  end

  it 'updates age when its their birthday' do
    Timecop.freeze(Time.parse("01 January 2000")) do
      subject.birthday_today?
      expect(subject.instance_variable_get(:@friends)).to eq([{name: "Jane", birthday: "01 January", age: 25}, {name: "Tim", birthday: "31 January", age: 12}])
    end
  end


end
