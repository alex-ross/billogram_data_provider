require 'json'

module BillogramDataProvider
  class MonthlyRevenue < Struct.new(:invoices)

    class Invoice
      attr_accessor :invoice_date, :state, :total_sum, :currency
      def initialize(attributes={})
        attributes.each do |key, value|
          method = "#{key}="
          send(method, value) if respond_to? method
        end
      end

      def total_sum=(value)
        @total_sum = value.to_f
      end

      def invoice_date_as_date
        Date.parse(invoice_date)
      rescue
        nil
      end
    end

    class Month < Struct.new(:year, :month, :amount)
    end

    def self.fetch(client:)
      response = client.get('/billogram?page=1&page_size=10000')
      json = JSON.parse(response.body)
      json_invoices = Array(json.dig('data'))
      invoices = json_invoices.map { |json| Invoice.new(json) }
      self.new(invoices)
    end

    def data
      hash = Hash.new(0)
      invoices.each do |invoice|
        next unless invoice.currency == 'SEK'
        hash["#{invoice.invoice_date_as_date.year}-#{invoice.invoice_date_as_date.month.to_s.rjust(2, '0')}"] += invoice.total_sum.to_i
      end

      keys = hash.keys.sort
      array = keys.map do |key|
        [named_month(key), hash[key]]
      end
      array.reverse[0,12].reverse
    end

    def as_result_item
      {
        type: 'table',
        title: 'Fakturerat per månad',
        meta: {
          header: ['Månad och år', 'Summa i SEK']
        },
        data: data
      }
    end

    def months
      %w[Jan Feb Mar Apr Maj Jun Jul Aug Sep Okt Nov Dec]
    end

    def named_month(key)
      year, month_number = key.split('-')
      "#{months[month_number.to_i - 1]} #{year}"
    end
  end
end
