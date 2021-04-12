module Superfaktura
  class Configuration
    attr_accessor :email, :token, :sandbox

    def initialize
      @email = ENV['SUPERFAKTURA_EMAIL']
      @token = ENV['SUPERFAKTURA_TOKEN']
      @sandbox = ENV['SUPERFAKTURA_SANDBOX'] == 'true' ? true : false
    end
  end
end
