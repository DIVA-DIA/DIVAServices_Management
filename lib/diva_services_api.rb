module DivaServicesApi
  include HTTParty

  base_uri 'localhost:8080'
  format :json

  def self.is_online?
    begin
      response = self.get('/')
      return true if response.success?
    rescue Errno::ECONNREFUSED => e
      #XXX Catching exceptions and doing nothing is like ignoring global warming
    end
    return false
  end
end
