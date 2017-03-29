ENV["ENVIRONMENT"] = "test"
require_relative "../app"
API.load!

require "rack/test"

RSpec.configure do |config|
  config.color = true

  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning &example
  end
end
