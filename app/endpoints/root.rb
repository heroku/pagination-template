module API
  module Endpoints
    class Root < Base
      get "/" do
        JSON.dump(hello: :world)
      end
    end
  end
end
