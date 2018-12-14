require_relative "../../spec/spec_helper.rb"
require_relative "../../app/aot_client.rb"

describe AotClient do

  it "intializes with hostname" do
    aot = AotClient.new

    aot.hostname.should == "https://api.arrayofthings.org/api"
  end

  describe "#send_request" do
    it "sends a request and returns the response" do
      aot = AotClient.new
      endpoint = "/projects"
      
      response = aot.send_request(endpoint, true, {})
      
      response.should_not == nil
    end
  end
end

