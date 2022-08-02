require_relative './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'ben', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom # rubocop:todo Lint/DuplicateMethods
    @classroom = classroom
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
