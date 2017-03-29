require "rspec/core/rake_task"
require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    # this is an awful hack because railties sucks
    # don't try that at home, kids
    %w[development test].each do |env|
      config = %x[env ENVIRONMENT=#{env} bin/runner "p ActiveRecord::Base.connection_config.stringify_keys"]
      ActiveRecord::Base.configurations[env] = eval(config)
    end

    require "./app"
    API.load!

    ActiveRecord::Tasks::DatabaseTasks.tap do |config|
      config.env = API::Config.environment
    end
  end
end

RSpec::Core::RakeTask.new(:spec)
task default: :spec
