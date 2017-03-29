require "spec_helper"

describe API::Endpoints::Things do
  include Rack::Test::Methods

  def app
    described_class
  end

  it "returns JSON collection" do
    Thing.create! id: 123, name: "thing-123"

    get "/things"

    expect(last_response.headers["Content-Type"]).to eq("application/json")

    json = JSON.parse(last_response.body)

    expect(json).to be_kind_of(Array)
    expect(json).to include("id" => 123, "name" => "thing-123")
  end
end
