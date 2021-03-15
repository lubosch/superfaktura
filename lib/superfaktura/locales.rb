module Superfaktura
  class Locales
    LANGUAGES = {
      en: 'eng',
      sk: 'slo',
      hu: 'hun',
      cs: 'cze',
      de: 'deu',
      hr: 'hrv',
      it: 'ita',
      pl: 'pol',
      ro: 'rom',
      ru: 'rus',
      sl: 'slv',
      es: 'spa',
      uk: 'ukr'
    }.freeze

    def self.iso2_to_iso3(iso2)
      LANGUAGES[iso2.to_sym] || 'eng'
    end
  end
end
