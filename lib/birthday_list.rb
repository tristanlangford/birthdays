
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
    Time.now.strftime("%d %B")
  end

  def birthday_today?
    @friends.each { |friend| birthday_message(friend) if friend[:birthday] == today }
  end

  def birthday_message(friend)
    update_age(friend)
    puts "It's #{friend[:name]}'s birthday today! They are #{friend[:age]} years old!"
  end

  def update_age(friend)
    friend[:age] = friend[:age] + 1
  end
end
