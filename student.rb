require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, name = 'unknown', age, parent_permission: true) # rubocop:todo Style/OptionalArguments
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
