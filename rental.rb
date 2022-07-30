class Rental
  attr_accessor :date, :book, :person

  def initialize(date = Time.now, book, person) # rubocop:todo Style/OptionalArguments
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end
end
