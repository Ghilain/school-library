require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @persons = []
    @books = []
  end

  def run
    options.each { |key, value| puts "#{key}: #{value}" }

    option = gets.chomp.to_i

    option(option)
  end

  private

  def add_person
    puts 'Create a student (1) or a teacher (2)? [by entering the number]: '

    type = gets.chomp.to_i

    puts 'Entered invalid data!' if type != 1 && type != 2

    add_student if type == 1

    add_teacher if type == 2
  end

  def list_people(show_index: false)
    @persons.each_with_index do |person, index|
      result = "[#{person.class.name}] ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"

      result = "#{index}) " + result if show_index

      puts result
    end
  end

  def add_student
    print 'Enter the name of the student: '

    name = gets.chomp.to_s

    print 'Enter the age of the student: '

    age = gets.chomp.to_i

    print 'Does he or she has parent permission? [Y/N]: '

    parent_permission = gets.chomp.to_s.downcase == 'y'

    student = Student.new(age, name, parent_permission: parent_permission)

    @persons << student

    puts 'Student created successfully'
  end

  def add_teacher
    print 'Enter the name of the teacher: '

    name = gets.chomp.to_s

    print 'Enter the age of the teacher: '

    age = gets.chomp.to_i

    print "Enter the teacher's specialization: "

    specilization = gets.chomp.to_s

    teacher = Teacher.new(specilization, age, name)

    @persons << teacher

    puts 'Teacher created successfully'
  end

  def list_books(show_index: false)
    @books.each_with_index do |book, index|
      result = "Title: \"#{book.title}\", Author: #{book.author}"

      result = " #{index}) " + result if show_index

      puts result
    end
  end

  def add_book
    print 'Enter the name of the book: '

    name = gets.chomp.to_s

    print 'Enter the author of the book: '

    author = gets.chomp.to_s

    book = Book.new(name, author)

    @books << book

    puts 'Book created successfully'
  end

  def list_rentals_by_person_id
    puts 'No person entry found' if @persons.empty?

    print 'Enter person ID: '

    id = gets.chomp.to_i

    @persons.each do |person|
      next unless person.id == id

      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author} "
      end
    end
  end

  def add_rental
    puts 'Select a book from the following list by number'

    list_books(show_index: true)

    book = gets.chomp.to_i

    puts 'Invalid input!' if !(book.is_a? Integer) && book >= @books.length

    puts 'Select a person from the following list by number (not id)'

    list_people(show_index: true)

    person = gets.chomp.to_i

    puts 'Invalid input!' if !(person.is_a? Integer) && person >= @people.length

    print 'Please enter the date: '

    date = gets.chomp.to_s

    Rental.new(date, @books[book], @persons[person])

    puts 'Rental created successfully'
  end
end
