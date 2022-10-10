require 'spec_helper'
require 'tempfile'

RSpec.describe Superfaktura::Invoices do
  let(:headers) { { 'Content-Type' => 'application/json' } }
  describe '.create' do
    subject { described_class.create({ id: 34_131 }) }
    it 'sends request to superfaktura' do
      stub_request(:post, 'https://moja.superfaktura.sk/invoices/create')
        .with(
          body: { data: '{"id":34131}' },
          headers: {
            'Authorization' => 'SFAPI email=email@superfaktura.sk&apikey=k324m3k',
            'Content-Type' => 'application/x-www-form-urlencoded'
          }
        ).and_return(body: '{ "error": 0, "success": true }', headers:)
      expect(subject['success']).to be_truthy
    end
  end

  describe '.download' do
    subject { described_class.download('23jk3n2', locale: :sk) }
    it 'sends request to superfaktura' do
      stub_request(:get, 'https://moja.superfaktura.sk/slo/invoices/pdf/23jk3n2')
        .with(
          headers: { 'Authorization' => 'SFAPI email=email@superfaktura.sk&apikey=k324m3k' }
        ).and_return(body: 'test text', headers:)
      expect(subject).to eq 'test text'
    end
  end
end
