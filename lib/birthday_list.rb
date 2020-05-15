
class Birthday_list

  def initialize
    @friends = []
  end

  def add_freind(name, birthday, age)
    @friends.push({name: name, birthday: birthday, age: age})
  end

  def show_all
    @friends.each { |friend| puts "#{friend[:name]}: #{friend[:birthday]}"}
  end

  def today
    Time.new.strftime("%d %b")
  end

  def birthday_today?
    @friends.each { |friend| birthday_message(friend) if friend[:birthday] == today }
  end

  def birthday_message(friend)
    puts "It's #{friend[:name]}'s birthday today! They are #{friend[:age] + 1} years old!"
  end

end
