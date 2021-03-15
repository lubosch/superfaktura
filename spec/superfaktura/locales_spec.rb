require 'spec_helper'

RSpec.describe Superfaktura::Locales do
  it 'returns lang based on locale' do
    expect(described_class.iso2_to_iso3('sk')).to eq 'slo'
    expect(described_class.iso2_to_iso3('en')).to eq 'eng'
    expect(described_class.iso2_to_iso3('hu')).to eq 'hun'
    expect(described_class.iso2_to_iso3('fr')).to eq 'eng'
  end
end
