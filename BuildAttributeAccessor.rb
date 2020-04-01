#https://www.youtube.com/watch?v=ab11lJJKm8M&feature=emb_title

class Cat
  def self.define_properties(props)
    props.each do |prop| #Defining the reader
      define_method(prop) do
        # puts "You called #{prop}"
        #What does the readrer need to do?
        #it needs to expose the instance variable like below
       instance_variable_get(:"@#{prop}") #This is how you read an instance variable based off some data
      end #end of define method
                        #ANOTHER WAY TO WRITE THE ABOVE LOOP
                        #   define_method(prop1) do
                        #   puts "You called #{prop1}"
                        #   end
                        #   define_method(prop2) do
                        #    puts "You called #{prop2}"
                        #     end
       define_method("#{prop}=") do |arg|#Defining the writer
        # name of the meths you are trying to dfine is "name=" or "prop="
        #What does the writer need to do? it needs to accept an argument
        instance_variable_set(:"@#{prop}", arg) #This is how you read an instance variable based off some data
       end #end of define method
     end #end to each loop
     end #end of function
    self.define_properties([:name,:breed])
end #end of the classe

##The above code is equivalent to attr_accessor :name, :breed
#TESTING
fido = Cat.new
fido.name = "set via metaprogramming"
puts fido.name

class Dog
attr_accessor :name, :breed,:owner
# attr_reader :name
# attr_writer :owner

def twinsies?
  true if self.owner.name == self.name
  #self refers to the instance of the dog itself
  #ex: fido.twinsies? self == FIDO
  #fido.name
  #fido.owner.name
end

def owner=(owner)
  @owner = Owner
  owner.pets << self #reciprovates the relationship
end

end




class Owner
  attr_accessor :name, :pets

  def initialize
    @pets = []
  end

end

fido = Dog.new
fido.name = "FIDO"

avi = Owner.new
avi.name = "AVI" #setting @name to a primitive
#at this moment, I need to inform avi that he has a new pet
fido.owner = avi #setting @owner to a mature object

#TESTING
# puts fido.owner.name
# puts fido.name
puts avi.pets
# puts fido.owner
# puts avi.name



# https://www.youtube.com/watch?v=UysgBTrJoTc&feature=emb_logo

#Understanding attribute accessor

class Person
  attr_accessor(:name)
  #There are only methods on onjects.
  #attr_accessor :name is equivalent to the both codes below
  #attr_accessor adds 2 instance methods to our objects, a reader and a writer.
  # Dog#name method for the reader and Dog#name= method for the writer.
  #These methods will read/write to an instance variable @name

  def name=(name)
    @name = name
  end

  def name
    @name
  end

  # attr_reader :gender
  # #How many methods get added above? One method added, gender, reader from an insance variable @gender
  #
  # attr_writer :last_meal
  # # 1 method added, last meal, writing to an instance variable @last_meal

end


# Understanding initialize

#an oject has a lifecycle, born --> events happen to it
#as soon as it is born .new is the initialize
# insitialize is considered hook, call back, lifecycle event

class Car
  attr_reader :name
  #Car#initialize will automatically fire upon evocation of Car.new
  def initialize(name)
    @name=name #Static Proprty
    @born_on = Time.now #static, never want to change
    puts "a new car was just created"
  end

  def age
      Time.now - @born_on
  end

end

#TESTING
# honda = Car.new("honda")
# puts honda.name
# puts honda.age
# puts honda.age
# puts honda.age
#honda.born_on #cant accomplish that




class Baby
attr_accessor :name
#we want to keep track of all babies born
#where can we do that?
  # the only place we can hook into a baby being born is in initialize
#whose responsibilty is it?
  #Save the baby. Put is somwhere where it wont get lost.
    # Where o we put that data
  def initialize(name = nil)
    @name = name
    cry
  end

  def cry
    puts "wahhh"
  end

end


#1. Make the babies cry when they are born => Baby.new -- initialize
#2. Give them a name (through reader/writer)
#3.Allow them to cry through a method cry
#4. Allow nam'es to be optionally set when they are born


puts Baby.new

blue_ivy = Baby.new
blue_ivy.name = "Blue Ivy"


# puts north_west.name
puts blue_ivy.name






# https://www.youtube.com/watch?time_continue=3311&v=Z_IoQCVNWtM&feature=emb_logo
