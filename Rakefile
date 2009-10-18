require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "xultestrunner"
    gem.executables = "xultest"
    gem.summary = %Q{XUL based test runner for running your JS unit tests.}
    gem.description = %Q{XUL based test runner for running your JS unit tests.}
    gem.email = "contact@gironda.org"
    gem.homepage = "http://github.com/gabrielg/xultestrunner"
    gem.authors = ["Gabriel Gironda"]
    gem.add_dependency "xpcomcore-rubygem", ">=0.5.3"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION')
    version = File.read('VERSION')
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "xultestrunner #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

gem 'jsdoc-toolkit'
require 'jsdoc-toolkit/doc_task'
JsDocToolkit::DocTask.new("doc:app") do |doc|
  doc.jsdoc_dir = "xpcomcore/app/doc"
  doc.jsdoc_files << "xpcomcore/app/chrome"
  doc.jsdoc_files << "xpcomcore/app/components"
  
end

require 'xpcomcore-rubygem/tasks/application_task.rb'
XPCOMCore::Tasks::ApplicationTask.new

task :gemspec do
  system("git", "add", "xpcomcore/app/application.ini")
  system("git", "commit", "-m", "Bumping application.ini", "xpcomcore/app/application.ini")
end