require 'spec_helper'

RSpec.describe BillogramDataProvider::Client do
  it 'can be initialized with username and password' do
    client = BillogramDataProvider::Client.new(username: '6402-qz0UHqRJ',
                                                password: '55e041056840d54dc8274f70c0a4170f')

    expect(client.username).to eq('6402-qz0UHqRJ')
    expect(client.password).to eq('55e041056840d54dc8274f70c0a4170f')
  end
end
