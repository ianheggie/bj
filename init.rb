dirname = File.dirname(File.expand_path(__FILE__))
libdir = File.join dirname, "lib"

$LOAD_PATH.unshift libdir unless $LOAD_PATH.include libdir

require "bj"
