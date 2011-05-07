require 'cgi'
require 'net/https'
require 'uri'

module Alert
  module Prowl
    extend self

    API_URL = "https://prowl.weks.net/publicapi"

    def notify(message,options={})
      options[:application] ||= 'Alert-Gem'
      options[:description] ||= message
      options[:event] ||= 'alert'
      options[:priority] ||= 0

      uri = URI.parse("#{API_URL}/add")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(uri.request_uri + "?" + options.map {|k, v| "#{k}=#{CGI.escape(v.to_s)}"}.join("&"))
      response = http.request(request)
      puts response.code.to_i
    end
  end
end

if __FILE__ == $0
  api_key = `defaults read net.weks.prowl apikey`.chomp
  Alert::Prowl.notify("Testing #{__FILE__}",{:apikey => api_key})
end
