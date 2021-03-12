require_relative 'support/simplecov'

require 'bundler/setup'
require 'superfaktura'
require 'webmock/rspec'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Superfaktura.configure do |config|
  config.email = 'email@superfaktura.sk'
  config.token = 'k324m3k'
end
