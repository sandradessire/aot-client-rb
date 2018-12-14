require "httparty"

class AotClient
  attr_accessor :hostname
  
  def initialize
    @hostname = "https://api.arrayofthings.org/api"
  end

  def send_request(endpoint, paged = true, filter = {})
    request_url = @hostname + endpoint
    response = HTTParty.get(request_url)
    response
  end


end