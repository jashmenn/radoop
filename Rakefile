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

JARS = Dir[File.dirname(__FILE__) + "/jars/*.jar"]
CLASSPATH_ADDITIONS = JARS.join(":")

def make_test_cmd
  test_globs = ['test/**/test_*.rb']
  tests = ["rubygems", "test/unit"] + test_globs.map { |g| Dir.glob(g) }.flatten
  tests.map! {|f| %(require "#{f}")}
  filter = ENV['FILTER'] || ENV['TESTOPTS']
  cmd = "#{Hoe::RUBY_FLAGS} -e '#{tests.join("; ")}' #{filter}"
  cmd
end

Rake::TaskManager.class_eval do
  def remove_task(task_name)
    @tasks.delete(task_name.to_s)
  end
end
 
def remove_task(task_name)
  Rake.application.remove_task(task_name)
end

desc 'Run the test suite. Use FILTER or TESTOPTS to add flags/args.'
remove_task(:test)
task :test do
  sh "CLASSPATH=$CLASSPATH:#{CLASSPATH_ADDITIONS} $JRUBY_HOME/bin/jruby " + make_test_cmd
end
