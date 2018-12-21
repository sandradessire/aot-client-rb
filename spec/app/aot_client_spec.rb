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

  describe "#list_projects" do
    it "returns the projects" do
      aot = AotClient.new
      projects = aot.list_projects

      projects.first.keys.should include(
        "slug", 
        "name", 
        "latest_observation", 
        "hull", 
        "first_observation", 
        "bbox", 
        "archive_url"
        )
    end
  end

  describe "#list_nodes" do
    it "lists the nodes" do
      aot = AotClient.new
      nodes = aot.list_nodes

      nodes.first.keys.should include(
        "vsn",
        "location",
        "description",
        "decommissioned_on",
        "commissioned_on",
        "address"
        )
    end
  end

  describe "#list_sensors" do
    it "lists the sensors" do
      aot = AotClient.new
      sensors = aot.list_sensors

      sensors.first.keys.should include(
        "uom",
        "subsystem",
        "sensor",
        "path",
        "parameter",
        "ontology",
        "min",
        "max",
        "data_sheet"
      )
    end
  end

  describe "#list_observations" do
    it "lists the observations" do
      aot = AotClient.new
      observations = aot.list_observations

      observations.first.keys.should include(
        "value",
        "timestamp",
        "sensor_path",
        "node_vsn"
      )
    end
  end
  
  describe "#list_raw_observations" do
    it "lists the raw observations" do
      aot = AotClient.new
      raw_observations = aot.list_raw_observations

      raw_observations.first.keys.should include(
        "timestamp",
        "sensor_path",
        "raw",
        "node_vsn",
        "hrf"
      )
    end
  end
end

