require 'bundler/gem_tasks'

# If you want to make this the default task
task :default => :test

desc "Run all the tests"
task :test do
  Dir.chdir('spec/rails_root') do
    sh "bundle"
    sh "bacon ../bj.rb"
  end
end
