require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(name = 'unknown', age, parent_permission: true) # rubocop:todo Style/OptionalArguments
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  private

  def is_of_age? # rubocop:todo Naming/PredicateName
    @age >= 18
  end
end
