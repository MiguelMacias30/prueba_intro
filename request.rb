require 'uri'
require 'net/http'
require 'openssl'
require 'json'

def get_data(address)
    url = URI(address)
    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    response = http.request(request)
    if response.code.to_i >= 400
        return nil
    else
        return JSON.parse(response.read_body)
    end
end
