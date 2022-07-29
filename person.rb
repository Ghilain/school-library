require_relative './nameable'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :parent_permission, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  private

  def is_of_age? # rubocop:todo Naming/PredicateName
    @age >= 18
  end

  public

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(book, self, date)
  end
end
