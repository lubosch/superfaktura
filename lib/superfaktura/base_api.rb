module Superfaktura
  class BaseApi
    SUPERFAKTURA_URL = 'https://moja.superfaktura.sk'.freeze
    SANDBOX_SUPERFAKTURA_URL = 'https://sandbox.superfaktura.sk'.freeze

    def self.client
      Faraday.new(url: superfaktura_url) do |builder|
        builder.request :url_encoded
        builder.request :json
        builder.response :json

        builder.adapter Faraday.default_adapter
      end
    end

    def self.file_client
      Faraday.new(url: superfaktura_url) do |builder|
        builder.request :url_encoded
        builder.request :json

        builder.adapter Faraday.default_adapter
      end
    end

    def self.request(uri, method = 'POST', payload = nil)
      response = client.public_send(method.downcase.to_sym) do |request|
        request.headers['Authorization'] = "SFAPI email=#{Superfaktura.config.email}&apikey=#{Superfaktura.config.token}"

        request.url(uri)
        request.body = "data=#{payload.to_json}" if payload
      end
      raise Superfaktura::Error, response.body['error_message'] unless response.body['error'].zero?

      response.body
    end

    def self.post(path, payload)
      request(path, 'POST', payload)
    end

    def self.get(path, payload = nil)
      request(path, 'GET', payload)
    end

    def self.superfaktura_url
      Superfaktura.config.sandbox ? SANDBOX_SUPERFAKTURA_URL : SUPERFAKTURA_URL
    end

    def self.file(uri)
      response = file_client.get(uri) do |request|
        request.headers['Authorization'] = "SFAPI email=#{Superfaktura.config.email}&apikey=#{Superfaktura.config.token}"
      end
      raise Superfaktura::Error, response.body['error_message'] unless response.status == 200

      response.body
    end
  end
end
