require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "SciMed-bj"
    gem.summary = %Q{Minor fork of ahoward/bj}
    gem.description = %Q{Forked ahoward/bj because the way the bin/bj before_run method interacts with Main's logger= instance menthod breaks in Ruby 1.8.7. Forked again to add missing 'require logger'}
    gem.email = ["josh.warchol@vibes.com", 'jk@jkraemer.net']
    gem.homepage = "http://github.com/jkraemer/bj"
    gem.authors = ["Ara T. Howard", "Joshua Warchol", "Jens Kraemer"]
    gem.add_dependency 'main', '>= 2.6.0'
    gem.add_dependency 'systemu', '>= 1.2.0'
    gem.add_dependency 'orderedhash', '>= 0.0.3'
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Bj (or a dependency) not available."
  puts $!
end

# From plugin
#require 'rake'
require 'rake/testtask'
require 'rdoc/task'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the bj plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the bj plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Bj'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
