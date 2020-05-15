
class Birthday_list

  def initialize
    @friends = []
  end

  def add_freind(name, birthday)
    @friends.push({name: name, date_of_birth: birthday})
  end

  def show_all
    @friends.each { |friend| puts "#{friend[:name]}: #{friend[:date_of_birth]}"}
  end

  def birthday_today?
    @friends.each { |friend| birthday_message(friend) if format_date(string_to_date(friend)) == today }
  end

  def birthday_message(friend)
    #update_age(friend)
    puts "It's #{friend[:name]}'s birthday today! They are #{age(friend)} years old!"
  end


  private

  def string_to_date(friend)
    Time.parse(friend[:date_of_birth])
  end

  def today
    format_date(Time.now)
  end

  def age(friend)
    Time.now.year - string_to_date(friend).year
  end

  def format_date(time)
    time.strftime("%d %B")
  end

end
