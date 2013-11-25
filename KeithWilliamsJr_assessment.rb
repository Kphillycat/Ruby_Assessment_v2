#1. Arrays
array = ["Blake","Ashley","Jeff"]
#a
array << "Keef"
#b
array.each do |name|
	puts name
end
#c
array[1]
#d 
array.find_index("Jeff")
#2. Hashes
instructor = {:name=>"Ashley", :age=>27}
#a 
instructor[:location]="NYC"
#b 
instructor.each do |key, value|
	puts "Key: #{key} => Value: #{value}"
end
#c 
instructor[:name]
#d 
instructor.key(27)
#3. Nested Structures
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}
#a 
school[:founded_in] = 2013
#b 
school[:students] << {:name => "Keith", :grade => "D+"}
#c
school[:students].collect { |student| student unless student[:name] == "Billy" }.compact
#d
school[:students].each do |student|
	student[:semester] = "Summer"
end
#e 
teacher = "Ashley"
nu_subject = "being almost better than Blake"
school[:instructors].each do |instructor|
	instructor[:subject] = nu_subject if instructor[:name] == teacher
end
#f 
student_name = "Frank"
initial_grade = "A"
replacement_grade = "F"
school[:students].each do |student|
	student[:grade] = replacement_grade if student[:name] == student_name
end
#g
given_grade = "B"
school[:students].collect do |student|
	student[:name] if student[:grade] == given_grade 
end.compact[0].to_s
#h Return the subject of the instructor "Jeff". Create a solution that would work for any instructor given, then give it the instructor `"Jeff"` and the new subject
instructor_name = "Jeff"
nu_subject = "new subject"
school[:instructors].collect do |instructor|
	instructor[:subject] if instructor[:name] == instructor_name
end.compact[0].to_s
#i
school.each do |key, value|
	if value.class == String
		puts "#{key} => #{value}"
	else
		value.each do |index|
			index.each do |second_key, second_value|
				puts "#{second_key} => #{second_value}"
			end
		end		
	end
end
#4 Methods
#a i
def return_grade(student_name, school)
	school[:students].each do |student|
		return student[:grade] if student[:name] == student_name
	end
end
#a ii 
def return_grade(student_name, school)
	school[:students].each do |student|
		return student[:grade] if student[:name] == student_name
	end
end

school.each do |key, value|
	if value.class == String
		puts "#{key} => #{value}"
	elsif key == :students
		value.each do |student|
	 		puts "#{student[:name]} => #{return_grade(student[:name],school)}"
	 	end
	else
		value.each do |index|
			index.each do |second_key, second_value|
				puts "#{second_key} => #{second_value}"
			end
		end		
	end
end
#b i.
def update_subject(instructor_name, new_subject, school)
	school[:instructors].select do |instructor|
		instructor[:subject] = new_subject if instructor[:name] == instructor_name
	end
end
#b ii
update_subject("Blake","Being Terrible", school)
#c i.
def add_new_student(student_name, student_grade, school)
	nu_student_hash = {}
	nu_student_hash[:name] = student_name
	nu_student_hash[:grade] = student_grade
	school[:students] << nu_student_hash
end
#c ii
add_new_student("Keith","A+",school)
#d i
def add_key(new_key, new_value, school)
	school[new_key.to_sym] = new_value
end
#d ii
add_key("Ranking", 1, school)
# 5. Object Orientation
#a.
class School
end
#b
class School
	def initialize
	end
end
#b i
class School
	def initialize
		@name
		@location
		@ranking
		@students
		@instructors
	end
end
#b ii
class School
	def initialize (name, location, ranking, students, instructors)
		@name
		@location
		@ranking
		@students
		@instructors
	end
end
#b iii 
class School
	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
	end
end
#c 
class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
	end
end
#d 
class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
	end

	def set_ranking(new_ranking)
		@ranking = new_ranking
	end
end
#e
class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
	end

	def set_ranking(new_ranking)
		@ranking = new_ranking
	end

	def add_student(student_name, student_grade, student_semester)
		nu_student_hash = {}
		nu_student_hash[:name] = student_name
		nu_student_hash[:grade] = student_grade
		nu_student_hash[:semester] = student_semester
		students << nu_student_hash
	end
end
#f
class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
	end

	def set_ranking(new_ranking)
		@ranking = new_ranking
	end

	def add_student(student_name, student_grade, student_semester)
		nu_student_hash = {}
		nu_student_hash[:name] = student_name
		nu_student_hash[:grade] = student_grade
		nu_student_hash[:semester] = student_semester
		students << nu_student_hash
	end

	def remove_student(student_name)
		@students.collect! do |student|
			student unless student[:name] == student_name
		end.compact
	end
end

#g 
class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	@@SCHOOLS = []

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
		@@SCHOOLS << self
	end

	def set_ranking(new_ranking)
		@ranking = new_ranking
	end

	def add_student(student_name, student_grade, student_semester)
		nu_student_hash = {}
		nu_student_hash[:name] = student_name
		nu_student_hash[:grade] = student_grade
		nu_student_hash[:semester] = student_semester
		students << nu_student_hash
	end

	def remove_student(student_name)
		@students.collect! do |student|
			student unless student[:name] == student_name
		end.compact
	end
end
# h
class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking
	@@SCHOOLS = []

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
		@@SCHOOLS << self
	end

	# def show_instances
	# 	puts @@SCHOOLS.size
	# end

	def reset
		@@SCHOOLS.clear
	end

	def set_ranking(new_ranking)
		@ranking = new_ranking
	end

	def add_student(student_name, student_grade, student_semester)
		nu_student_hash = {}
		nu_student_hash[:name] = student_name
		nu_student_hash[:grade] = student_grade
		nu_student_hash[:semester] = student_semester
		students << nu_student_hash
	end

	def remove_student(student_name)
		@students.collect! do |student|
			student unless student[:name] == student_name
		end.compact
	end
end

#6 Classes
#a
class Student
	attr_accessor :name, :grade, :semester

	def initialize(name, grade, semester)
		@name = name
		@grade = grade
		@semester = semester
	end
end
#b
require './Student'

class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking, :SCHOOLS
	@@SCHOOLS = []

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
		@@SCHOOLS << self
	end

	def reset
		@@SCHOOLS.clear
	end

	def set_ranking(new_ranking)
		@ranking = new_ranking
	end

	def add_student(student_name, student_grade, student_semester)
		nu_student_object = Student.new(student_name, student_grade, student_semester)
		students << nu_student_object
	end

	def remove_student(student_name)
		@students.collect! do |student|
			student unless student[:name] == student_name
		end.compact
	end
end

#c
require './Student'

class School
	attr_accessor :name, :location, :instructors, :students
	attr_reader :ranking, :SCHOOLS
	@@SCHOOLS = []

	def initialize (name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
		@@SCHOOLS << self
	end

	def reset
		@@SCHOOLS.clear
	end

	def set_ranking(new_ranking)
		@ranking = new_ranking
	end

	def add_student(student_name, student_grade, student_semester)
		nu_student_object = Student.new(student_name, student_grade, student_semester)
		students << nu_student_object
	end

	def remove_student(student_name)
		@students.collect! do |student|
			student unless student[:name] == student_name
		end.compact
	end

	def find_student(student_name)
		students.each do |student|
			return student if student.name == student_name
		end
	end
end

#7. Self
#a
hello
<ObjectId of class>
#b
Nothing, unless instantiated and method is called
#c
<ObjectId of class>
#d
<ObjectId of instance of the class>
#e
goodbye

