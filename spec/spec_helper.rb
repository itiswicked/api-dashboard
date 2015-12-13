ENV["RACK_ENV"] ||= "test"

require_relative '../dashboard.rb'
require_relative '../lib/weather'
require_relative '../lib/events'
require_relative '../lib/news'

require "capybara/rspec"
require "pry"
require "rspec"
require "vcr"
require "webmock/rspec"

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!
  config.default_cassette_options = { record: :new_episodes }
  config.before_record do |i|
    i.response.body.force_encoding('UTF-8')
  end
  # config.filter_sensitive_data('<HIDDEN API KEY>') { ENV['YOUR_API_KEY'] }
end

Capybara.app = Dashboard
