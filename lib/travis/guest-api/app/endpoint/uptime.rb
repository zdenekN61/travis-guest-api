require 'travis/guest-api/app/base'

class Travis::GuestApi::App::Endpoint
  # endpoint for uptime call
  class Uptime < Travis::GuestApi::App::Base
    get '/uptime' do
      halt 200, {
        service: 'OK'
      }.to_json
    end
  end
end
