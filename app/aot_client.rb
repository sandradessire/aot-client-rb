require "httparty"

class AotClient
  attr_accessor :hostname
  
  def initialize
    @hostname = "https://api.arrayofthings.org/api"
  end

  def list_projects
    send_request("/projects")["data"]
  end

  def list_nodes
    send_request("/nodes")["data"]
  end
  
  def list_sensors
    send_request("/sensors")["data"]
  end

  def list_observations
    send_request("/observations")["data"]
  end
  
  def list_raw_observations
    send_request("/raw-observations")["data"]
  end

  def send_request(endpoint, paged = true, filter = {})
    request_url = @hostname + endpoint
    response = HTTParty.get(request_url).body
    JSON.parse(response)
  end


end