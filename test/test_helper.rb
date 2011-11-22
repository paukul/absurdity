ENV["RAILS_ENV"] = "test"
require 'minitest/autorun'
require 'mock_redis'
require 'absurdity'
require 'redis'
require 'mocha'
require 'turn'

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"

class MiniTest::Unit::TestCase

  def teardown
    config = Absurdity::Config.instance
    config.redis && config.redis.flushdb
    config.instance_variable_set(:@redis, nil)
  end

end

Rails.backtrace_cleaner.remove_silencers!
