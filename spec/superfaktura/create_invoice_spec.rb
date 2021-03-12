require 'spec_helper'

RSpec.describe Superfaktura::CreateInvoice do
  describe '.call' do
    subject { described_class.call({ id: 34131 }) }
    it 'sends request to superfaktura' do
      stub_request(:post, 'https://moja.superfaktura.sk/invoices/create')
        .with(
          body: { data: '{"id":34131}' },
          headers: {
            'Authorization' => 'SFAPI email=email@superfaktura.sk&apikey=k324m3k',
            'Content-Type' => 'application/x-www-form-urlencoded'
          }
        ).and_return(body: '{ "error": 0, "success": true }')
      expect(subject['success']).to be_truthy
    end
  end
end