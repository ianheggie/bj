#!/usr/bin/env ruby

dirname = File.dirname(File.expand_path(__FILE__))

libdir = '../lib'
bindir = '../bin'
gem_home = 'gem_home'

rails_root = File.expand_path File.join(dirname, '../../../')
puts "RAILS_ROOT THOUGHT TO BE #{rails_root}"
scriptdir = File.join(rails_root, 'script')
scriptdir = File.join(rails_root, 'bin') unless File.directory?(scriptdir)
bj = File.join scriptdir, 'bj'

## bj shouldnt include a second copy of itself
#gems = %w[ attributes arrayfields main systemu orderedhash bj ]
gems = %w[ attributes arrayfields main systemu orderedhash ]

# in the plugin dir... 
Dir.chdir dirname do
  puts "in #{ dirname }..."

  # install gems locally
  puts "installing #{ gems.join ' ' } to #{gem_home} ..."
  spawn "gem install #{ gems.join ' ' } --install-dir=#{ gem_home } --remote --force --include-dependencies --no-wrappers"
  puts "."

=begin
=end
  # copy libs over to libdir
  glob = File.join gem_home, "gems/*/lib/*"
  entries = Dir.glob glob
  entries.each do |entry|
    next if entry =~ %r/-\d+\.\d+\.\d+\.rb$/
    src, dst = entry, libdir
    puts "#{ src } -->> #{ dst }..."
    FileUtils.cp_r src, dst 
    puts "."
  end

  # copy bins over to bindir 
  glob = File.join gem_home, "gems/*/bin/*"
  entries = Dir.glob glob
  entries.each do |entry|
    next if entry =~ %r/-\d+\.\d+\.\d+\.rb$/
    src, dst = entry, bindir
    puts "#{ src } -->> #{ dst }..."
    FileUtils.cp_r src, dst 
    puts "."
  end

  # install bin/bj to script/bj
  src, dst = File.join(bindir, "bj"), bj
  puts "#{ src } -->> #{ dst }..."
  FileUtils.cp src, dst
  File.chmod 0755, dst
  puts "."

  # kill all the local gems
  FileUtils.rm_rf gem_home

  # dump help
  puts("=" * 79)
  ruby = which_ruby
  system "#{ ruby } #{ bj.inspect } '--help'"
end



BEGIN {
  require 'fileutils'
  require 'rbconfig'

  def spawn command
    oe = `#{ command } 2>&1`
    raise "command <#{ command }> failed with <#{ $?.inspect }>" unless $?.exitstatus == 0
    oe
  end

  def which_ruby
    c = ::Config::CONFIG
    ruby = File::join(c['bindir'], c['ruby_install_name']) << c['EXEEXT']
    raise "ruby @ #{ ruby } not executable!?" unless test(?e, ruby)
    ruby
  end
}
