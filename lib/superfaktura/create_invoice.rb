module Superfaktura
  class CreateInvoice < BaseApi
    def self.call(attributes)
      post('/invoices/create', attributes)
    end
  end
end
