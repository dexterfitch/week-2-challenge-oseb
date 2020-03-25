require 'pry'

class Cli
  def start
    puts "Welcome to the Pet Shop CLI"
    menu
  end

  def menu
    puts "Type '1' to view list of pets"
    puts "Type '2' to create a pet"
    puts "Type 'exit' to exit program"
    user_input = gets.chomp
    menu_input(user_input)
  end

  def list_pets
    Pet.all
  end

  def menu_input(user_input)
    if user_input == "1"
      list_pets
      menu
    elsif user_input == "2"
      Pet.create_pet
      puts "Pet Created"
      menu
    elsif user_input.downcase == "exit"
      puts "Goodbye!"
    else
      puts "Invalid Response, Please Try Again"
      menu
    end
  end
end

class Pet
  @@all = []

  attr_accessor :name, :age, :species

  def initialize(name, age, species)
    @name = name
    @age = age
    @species = species
    @@all << self
  end

  def self.create_pet(name, age, species)
    Pet.new(name, age, species)
  end

  def self.all
    @@all
  end
end


# comment this in when you are ready to start the program
Cli.new.start