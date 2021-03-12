module Superfaktura
  class BaseApi
    SUPERFAKTURA_URL = 'https://moja.superfaktura.sk'.freeze

    def self.client
      Faraday.new(url: SUPERFAKTURA_URL) do |builder|
        builder.request :url_encoded
        builder.request :json
        builder.response :json

        builder.adapter Faraday.default_adapter
      end
    end

    def self.request(uri, method = 'POST', payload = nil)
      response = client.public_send(method.downcase.to_sym) do |request|
        request.headers['Authorization'] = "SFAPI email=#{Superfaktura.config.email}&apikey=#{Superfaktura.config.token}"

        request.url(uri)
        request.body = "data=#{payload.to_json}"
      end
      raise Superfaktura::Error, response.body['error_message'] unless response.body['error'].zero?

      response.body
    end

    def self.post(path, payload)
      request(path, 'POST', payload)
    end
  end
end
