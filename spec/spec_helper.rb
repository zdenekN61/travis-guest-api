require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'bundler/setup'
require 'travis/guest-api/app'

ENV['RAILS_ENV'] = ENV['RACK_ENV'] = ENV['ENV'] = 'test'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end
