require 'rubygems'

Gem::Specification::new do |spec|
  $VERBOSE = nil
  spec.name = 'bj' 
  spec.version = '0.0.0'
  spec.platform = Gem::Platform::RUBY
  spec.summary = 'bj' 

  spec.files = Dir::glob "**/**"
  spec.executables = Dir::glob("bin/*").map{|exe| File::basename exe}
  
  spec.require_path = "lib" 
  #spec.autorequire = lib

  spec.has_rdoc = File::exist? "doc" 
  spec.test_suite_file = "spec/bj.rb" if File::directory? "test"
  #spec.add_dependency 'attributes', '>= 5.0.0'
  spec.add_dependency 'main', '>= 2.6.0'
  spec.add_dependency 'systemu', '>= 1.2.0'
  spec.add_dependency 'orderedhash', '>= 0.0.3'
  spec.add_development_dependency 'bacon', '>= 1.2.0'

  spec.extensions << "extconf.rb" if File::exists? "extconf.rb"

  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "http://codeforpeople.com/lib/ruby/bj/"
  spec.rubyforge_project = "codeforpeople"
end
