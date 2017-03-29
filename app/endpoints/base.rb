module API
  module Endpoints
    class Base < Sinatra::Base
      require "sinatra/namespace"
      register Sinatra::Namespace

      set :raise_errors, true
      set :root, API::Config.root
      set :show_exceptions, false
      set :dump_errors, false

      configure :development do
        require "sinatra/reloader"
        register Sinatra::Reloader
        also_reload API::Config.root.join("app/**/*.rb").to_s
      end

      before { content_type :json }
    end
  end
end
