require 'spec_helper'

RSpec.describe Superfaktura::BaseApi do
  describe '.request' do
    subject { described_class.request('/url', 'POST', { id: 34131 }) }
    it 'sends request to superfaktura' do
      stub_request(:post, 'https://moja.superfaktura.sk/url')
        .with(
          body: { data: '{"id":34131}' },
          headers: {
            'Authorization' => 'SFAPI email=email@superfaktura.sk&apikey=k324m3k',
            'Content-Type' => 'application/x-www-form-urlencoded'
          }
        ).and_return(body: '{ "error": 0, "success": true }')
      expect(subject['success']).to be_truthy
    end

    context 'when error' do
      it 'throws an error' do
        stub_request(:post, 'https://moja.superfaktura.sk/url')
          .with(
            body: { data: '{"id":34131}' },
            headers: {
              'Authorization' => 'SFAPI email=email@superfaktura.sk&apikey=k324m3k',
              'Content-Type' => 'application/x-www-form-urlencoded'
            }
          ).and_return(body: '{ "error": 1, "error_message": "Something wrong with your request" }')
        expect { subject }.to raise_exception(Superfaktura::Error) do |error|
          expect(error.message).to eq 'Something wrong with your request'
        end
      end
    end
  end
end
