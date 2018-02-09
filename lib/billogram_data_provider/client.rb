require 'httparty'

module BillogramDataProvider
  class Client
    include HTTParty
    extend Forwardable
    delegate [:get] => self

    attr_accessor :username, :password, :endpoint

    def initialize(options={})
      @username = options.fetch(:username)
      @password = options.fetch(:password)
      @endpoint = options.fetch(:endpoint) { 'https://billogram.com/api/v2' }

      setup_client
    end

    private

    def setup_client
      self.class.default_options.merge!(
        base_uri: endpoint,
        basic_auth: {
          username: username,
          password: password
        }
      )
    end
  end
end
