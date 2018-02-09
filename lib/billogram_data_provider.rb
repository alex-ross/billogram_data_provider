require "billogram_data_provider/version"
require "billogram_data_provider/client"
require "billogram_data_provider/result"
require "billogram_data_provider/provider"
require "billogram_data_provider/cash_flow"
require "billogram_data_provider/monthly_revenue"

module BillogramDataProvider
  def self.new(*attr)
    BillogramDataProvider::Provider.new(*attr)
  end
end

