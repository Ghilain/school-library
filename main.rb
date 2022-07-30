require './app'

def main
  app = App.new

  app.run
end

def options
  puts 'Welcome to School Library App!'

  puts 'Choose an option by entering a number:'

  puts

  {

    1 => 'List all books',

    2 => 'List all people',

    3 => 'Create a person',

    4 => 'Create a book',

    5 => 'Create a rental',

    6 => 'List all rentals for a given person id',

    7 => 'Exit'

  }
end

def option(option)
  option_list = { 1 => 'list_books',
                  2 => 'list_people',
                  3 => 'add_person',
                  4 => 'add_book',
                  5 => 'add_rental',
                  6 => 'list_rentals_by_person_id',
                  7 => 'exit' }

  if option_list.key?(option)

    send(option_list[option])

  else

    puts 'Entered invalid data!'

  end

  run
end

main
