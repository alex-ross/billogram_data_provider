module BillogramDataProvider
  class Provider
    def initialize(options={})
      @client = BillogramDataProvider::Client.new(options)
    end

    def fetch
      cash_flow = CashFlow.fetch(client: client)
      Result.new([cash_flow.as_result_item])
    end

    private

    def client
      @client
    end
  end
end
