module Superfaktura
  class CheckConnection < BaseApi
    def self.call
      Faraday.get('https://moja.superfaktura.sk/countries').status == 200
    end
  end
end
