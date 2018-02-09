require 'spec_helper'

RSpec.describe BillogramDataProvider::CashFlow do
  describe '.fetch' do
    context 'when cash flow is 762672.00' do
      it 'returns an new CashFlow instance with value 762672' do
        stub_cash_flow_request(amount: 762672)
        client = BillogramDataProvider::Client.new(username: 'user', password: 'pass')
        cash_flow = BillogramDataProvider::CashFlow.fetch(client: client)
        expect(cash_flow.value).to eq(762672)
      end
    end

    context 'when cash flow is 1000000.00' do
      it 'returns an new CashFlow instance with value 1000000' do
        stub_cash_flow_request(amount: 1000000)
        client = BillogramDataProvider::Client.new(username: 'user', password: 'pass')
        cash_flow = BillogramDataProvider::CashFlow.fetch(client: client)
        expect(cash_flow.value).to eq(1000000)
      end
    end
  end
end
