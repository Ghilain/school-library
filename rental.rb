class Rental
  attr_accessor :date

  def initialize(book, person, date = Time.now)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end
end
