# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{xultestrunner}
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Gabriel Gironda"]
  s.date = %q{2009-10-20}
  s.description = %q{XUL based test runner for running your JS unit tests.}
  s.email = %q{contact@gironda.org}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/xultestrunner/tasks/test_task.rb",
     "test/test_helper.rb",
     "test/xultestrunner_test.rb",
     "xpcomcore/app/application.ini",
     "xpcomcore/app/chrome/chrome.manifest",
     "xpcomcore/app/chrome/content/scripts/xul_test_runner.js",
     "xpcomcore/app/chrome/content/xul/main_window.xul",
     "xpcomcore/app/chrome/icons/default/default.png",
     "xpcomcore/app/components/bootstrapper.js",
     "xpcomcore/app/defaults/preferences/prefs.js",
     "xpcomcore/stub_runners/XULTestRunner.app/Contents/Info.plist",
     "xpcomcore/stub_runners/XULTestRunner.app/Contents/MacOS/stub_runner",
     "xpcomcore/stub_runners/XULTestRunner.app/Contents/PkgInfo",
     "xpcomcore/stub_runners/XULTestRunner.app/Contents/Resources/.gitignore",
     "xpcomcore/stub_runners/XULTestRunner.app/Contents/Resources/xultestrunner.icns",
     "xultestrunner.gemspec"
  ]
  s.homepage = %q{http://github.com/gabrielg/xultestrunner}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{XUL based test runner for running your JS unit tests.}
  s.test_files = [
    "test/test_helper.rb",
     "test/xultestrunner_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<xpcomcore-rubygem>, [">= 0.6.3"])
    else
      s.add_dependency(%q<xpcomcore-rubygem>, [">= 0.6.3"])
    end
  else
    s.add_dependency(%q<xpcomcore-rubygem>, [">= 0.6.3"])
  end
end
