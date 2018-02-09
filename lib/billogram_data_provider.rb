require "billogram_data_provider/version"
require "billogram_data_provider/client"
require "billogram_data_provider/result"
require "billogram_data_provider/provider"
require "billogram_data_provider/cash_flow"

module BillogramDataProvider
  def self.new(*attr)
    BillogramDataProvider::Provider.new(*attr)
  end
end
