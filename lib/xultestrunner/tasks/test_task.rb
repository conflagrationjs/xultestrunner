require 'rake'

module XULTestRunner
  class TestTask
    # TODO - allow for multiple 'test libs' options and once xultestrunner
    # is better, allow for test patterns
    attr_accessor :test_lib, :test_dir
    
    def initialize(task_name = "test")
      desc("Runs XULTestRunner based tests")
      yield(self)
      task(task_name) { self.invoke }
    end
    
    def invoke
      system("xpcomcore", "launch", "xultestrunner", "--", "-testDir", test_dir, "-testLibs", test_lib)
    end
    
  end # TestTask
end   # XULTestRunner