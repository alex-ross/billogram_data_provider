module BillogramDataProvider
  class Result
    attr_reader :expires_at, :data

    def initialize(data)
      @data = data
      one_hour = 60 * 60
      @expires_at = Time.now + one_hour
    end
  end
end
