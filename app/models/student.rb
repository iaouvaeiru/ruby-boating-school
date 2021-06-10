class Student
    @@all = []
    attr_reader :first_name
    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end
    def self.all
        @@all
    end
    def add_boating_test(name, status, instructor)
        BoatingTest.new(self, name, status, instructor)
    end
    def all_tests
        BoatingTest.all.select {|test| test.student == self}
    end
    def all_instructors
        all_tests.map {|test| test.instructor}
    end
    def self.find_student(name)
        Student.all.find {|student| student.first_name == name}
    end
    def passed_tests
        all_tests.select {|test| test.test_status == "passed"}
    end
    def grade_percentage
        (passed_tests.count.to_f / all_tests.count)*100
    end
end
