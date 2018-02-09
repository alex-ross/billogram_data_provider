require 'spec_helper'

RSpec.describe BillogramDataProvider::Provider do
  describe '#fetch' do
    it 'will return an instance of BillogramDataProvider::Result' do
      stub_cash_flow_request
      provider = BillogramDataProvider::Provider.new(username: 'user', password: 'pass')
      expect(provider.fetch).to be_an_instance_of(BillogramDataProvider::Result)
    end

    describe 'returned result' do
      it 'will include text data for "Kassaflöde"' do
        stub_cash_flow_request
        provider = BillogramDataProvider::Provider.new(username: 'user', password: 'pass')

        result = provider.fetch
        cash_flow = result.data.find { |item| item[:title] == 'Kassaflöde' }

        expect(cash_flow[:type]).to eq('text')
      end
    end
  end
end
