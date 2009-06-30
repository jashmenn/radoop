require 'rubygems'
require File.dirname(__FILE__) + "/test_helper"
require File.dirname(__FILE__) + "/../lib/jruby_hadoop_environment"
require 'mocha'
require 'java'

# This is a stub for the Hadoop DistributedCache feature.
module Java
  module OrgApacheHadoopFileCache
    class DistributedCache
      def self.get_local_cache_files(jobconf)
        %w(/tmp/jrubybase)
      end

      def self.get_local_cache_archives(jobconf)
        %w(/tmp/foo_gem /tmp/bar_gem /tmp/ra /tmp/rb)
      end
    end
  end
end

class JrubyHadoopEnvironmentTest < Test::Unit::TestCase
  test "true" do
    assert(true)
  end

  # pending
  # test "setup jruby environment" do
  #   JrubyHadoopEnvironment.new.setup_jruby_environment(jobconf_stubs)
  #   gem_paths = ENV['GEM_PATH'].split(':')
  #   puts "split gems #{gem_paths.inspect}"
  #   assert(gem_paths.find {|p| "/tmp/jrubybase/lib/ruby/gems/1.8" == p})
  #   assert(gem_paths.find {|p| "/tmp/foo_gem" == p})
  #   assert(gem_paths.find {|p| "/tmp/bar_gem" == p})
  #   assert($LOAD_PATH.find {|p| "/tmp/jrubybase/lib/ruby/1.8/java" == p})
  #   assert($LOAD_PATH.find {|p| "/tmp/ra" == p})
  # end
  
  protected
  
  def jobconf_stubs
    # jc = stub('jobconf')
    jc = Java::ComRestphoneRadoop::RadoopJobConf.new(org.apache.hadoop.conf.Configuration.new())
    jc.set_ruby_gems("foo_gem:bar_gem")
    # jc.set("mapred.cache.localArchives", "/tmp");
    # jc.responds_like(Java::ComRestphoneRadoop::RadoopJobConf)
    # jc.stubs(:get_ruby_gems).returns('foo_gem:bar_gem')
    jc.stubs(:get_job_name).returns('arealjob')
    jc.stubs(:getJrubyBaseZipfile).returns('jrubybase')
    jc
  end
end