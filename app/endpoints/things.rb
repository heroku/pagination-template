module API
  module Endpoints
    class Things < Base
      namespace "/things" do
        get do
          range_header = request.env["HTTP_RANGE"]

          # TODO: actually parse and paginate

          things = Thing.all
          things.to_json
        end
      end
    end
  end
end
