require 'spec_helper'

RSpec.describe Superfaktura::CheckConnection do
  describe '.call' do
    subject { described_class.call }
    it 'checks countries response and returns true' do
      stub_request(:get, 'https://moja.superfaktura.sk/countries').and_return({ status: 200 })
      expect(subject).to be_truthy
    end
    context 'when error' do
      it 'checks countries response and returns false' do
        stub_request(:get, 'https://moja.superfaktura.sk/countries').and_return({ status: 500 })
        expect(subject).to be_falsey
      end
    end
  end
end
