
class Friend

  def initialize
    @friends = []
  end

  def add_freind(name, birthday, age)
    @friends.push({name: name, birthday: birthday, age: age})
  end

  def show_all
    @friends.each { |friend| puts "#{friend[:name]}: #{friend[:birthday]}"}
  end

end
