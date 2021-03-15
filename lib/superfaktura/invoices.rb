module Superfaktura
  class Invoices < BaseApi
    def self.create(attributes)
      post('/invoices/create', attributes)
    end

    def self.download(id, locale: :en)
      get("/#{Superfaktura::Locales.iso2_to_iso3(locale)}/invoices/pdf/#{id}")
    end
  end
end
