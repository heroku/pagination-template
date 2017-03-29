module API
  Web = Rack::Builder.new do
    use Rack::Deflater
    use Rack::MethodOverride

    require "sinatra/router"

    use Sinatra::Router do
      mount API::Endpoints::Things
    end

    run API::Endpoints::Root
  end
end
