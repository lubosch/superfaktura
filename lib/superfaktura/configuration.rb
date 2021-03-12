module Superfaktura
  class Configuration
    attr_accessor :email, :token

    def initialize
      @email = ENV['SUPERFAKTURA_EMAIL']
      @token = ENV['SUPERFAKTURA_TOKEN']
    end
  end
end
