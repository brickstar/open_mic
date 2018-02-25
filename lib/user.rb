require 'csv'
require 'pry'
class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(other_user, joke)
    other_user.learn(joke)
  end

  def perform_routine_for(other_user)
    @jokes.each do |joke|
      other_user.learn(joke)
    end
  end

  def learn_routine(file)
    binding.pry
    data = CSV.open file, headers: true, header_converters: :symbol
      data.each do |joke|
      @jokes << Joke.new(joke)
    end 
  end
end
