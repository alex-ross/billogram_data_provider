require 'spec_helper'

RSpec.describe BillogramDataProvider::MonthlyRevenue do
  describe '.fetch' do
    it 'will return revenue for last 12 month' do
      stub_monthly_revenue_request
      client = BillogramDataProvider::Client.new(username: 'user', password: 'pass')
      monthly_revenue = BillogramDataProvider::MonthlyRevenue.fetch(client: client)
      expect(monthly_revenue.invoices.count).to eq(31)
    end
  end
end
