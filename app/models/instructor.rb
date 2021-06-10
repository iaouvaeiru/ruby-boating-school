class Instructor
    @@all = []
    attr_reader :name
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def all_tests
        BoatingTest.all.select {|test| test.instructor == self}
    end
    def passed_tests
        all_tests.select {|test| test.test_status == "passed"}
    end
    def passed_students
        passed_tests.map {|test| test.student}
    end
    def pass_student(student, test)
        test_to_update = BoatingTest.all.find{|test| test.test_name == test && test.student == student}
        binding.pry
        if test_to_update.nil? 
            BoatingTest.new(student, test, "passed", self)
        else
            test_to_update.test_status = "passed"
        end
    end
    def fail_student(student, test)
        test_to_update = BoatingTest.all.find{|test| test.test_name == test && test.student == student}
        if test_to_update.nil? 
            BoatingTest.new(student, test, "failed", self)
        else
            test_to_update.test_status = "failed"
        end
    end
    def all_students
        all_tests.map {|test| test.student}
    end
end
