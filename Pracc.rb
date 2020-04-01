#
#
# class Human
#   attr_accessor :name, :age
#   @@all =[]
#
#   def initialize(name, age)
#     @name = name
#     @age = age
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.baby(name)
#     self.new(name,0)
#   end
#
# end
#
# puts Human.new("Megan", 10)
# puts Human.name
# puts Human.all
# # puts .all


class Song

  @@all = []
  @@name = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@name << name
    puts self
    @@all << self

  end

  def self.all
    @@all
  end

  def self.print_all_song_names
    puts @@name
    @@all.each do |name|
     puts "#{name}"
   end
end

end

ninety_nine_problems = Song.new("99 Problems")
thriller = Song.new("Thriller")

puts Song.print_all_song_names
