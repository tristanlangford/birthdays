require 'birthday_list.rb'
require 'timecop'

describe Birthday_list do
  subject {Birthday_list.new}

  before :each do
    subject.add_freind("Jane", "01 January 1960" )
    subject.add_freind("Tim", "31 January 1980")
  end

  it 'responds to add_friend method' do
    expect(subject).to respond_to(:add_freind).with(2).arguments
  end

  it 'can hold new friends' do
    subject.add_freind("Test", "1 May 1972")
    expect(subject.instance_variable_get(:@friends)).to include({name: "Test", date_of_birth: "1 May 1972"})
  end

  it 'can hold multiple friends' do
    expect(subject.instance_variable_get(:@friends)).to include({name: "Jane", date_of_birth: "01 January 1960"}, {name: "Tim", date_of_birth: "31 January 1980"})
  end

  it 'puts friends on a line each with all details when requested' do
    expect{subject.show_all}.to output("Jane: 01 January 1960\nTim: 31 January 1980\n").to_stdout
  end

  it 'outputs a string when it is someones birthday' do
    Timecop.freeze(Time.parse('01 January 2000')) do
      expect{subject.birthday_today?}.to output("It's Jane's birthday today! They are 40 years old!\n").to_stdout
    end
  end

end
