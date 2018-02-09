require 'json'

module BillogramDataProvider
  class CashFlow < Struct.new(:value)

    def self.fetch(client:)
      response = client.get('/billogram?page=1&page_size=1')
      json = JSON.parse(response.body)
      total_remaining_sum = json.dig('meta', 'total_remaining_sum')
      self.new(total_remaining_sum.to_i)
    end

    def as_result_item
      {
        type: 'text',
        title: 'Kassaflöde',
        data: "#{value} kr"
      }
    end
  end
end
