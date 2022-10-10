require 'json'
require 'faraday'

require 'superfaktura/version'
require 'superfaktura/configuration'
require 'superfaktura/locales'
require 'superfaktura/base_api'
require 'superfaktura/invoices'
require 'superfaktura/check_connection'

module Superfaktura
  @configuration = Configuration.new

  def self.config
    @configuration
  end

  def self.configure
    yield(@configuration)
  end

  class Error < StandardError
  end
end
