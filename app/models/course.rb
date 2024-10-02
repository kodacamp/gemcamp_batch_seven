class Course < ApplicationRecord
  has_many :students
end

# Course.create(name: 'BSIT')
# Student.create(name: 'mark', course_id: 1)
# Student.create(name: 'mark', course: Course.first)
# Course.first.students.create(name: 'jerome')

# Course.create(name: 'BSECE', students: [Student.create(name: 'test_one'),
#                                         Student.create(name: 'test_two')])

# Course.first.students
# Course.first.students.each do |student|
#   p student.name
# end

# Student.all.each do |student|
#   p student.course.name
# end