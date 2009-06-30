require 'rubygems'
require 'hoe'

class Radoop
  VERSION = '0.0.1'
end

Hoe.spec('radoop') do |p|
  p.version = Radoop::VERSION
  p.developer('James Moore', 'james@restphone.com')
  p.description = 'radoop is a jruby interface to Hadoop'
  p.summary = 'radoop is a jruby interface to Hadoop'
  p.url = 'http://github.com/banshee/radoop/tree'
end
