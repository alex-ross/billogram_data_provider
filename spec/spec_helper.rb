require "bundler/setup"
require 'webmock/rspec'
require "billogram_data_provider"

module TestHelpers
  def stub_cash_flow_request(amount: 1_000_000)
    json = <<~JSON
      {
        "status": "OK",
        "meta": {
          "total_count": 0,
          "total_remaining_sum": "#{amount}.00"
        },
        "data": []
      }
    JSON
    stub_request(:get, "https://billogram.com/api/v2/billogram?page=1&page_size=1")
      .to_return(status: 200, body: json, headers: {})
  end

  def stub_monthly_revenue_request
    this_path = File.expand_path(File.dirname(File.dirname(__FILE__)))
    json = File.read(File.join(this_path, 'spec', 'fixtures', 'responses', 'billogram.json'))
    stub_request(:get, "https://billogram.com/api/v2/billogram?page=1&page_size=10000")
      .to_return(status: 200, body: json, headers: {})
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include TestHelpers
end


