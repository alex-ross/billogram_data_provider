RSpec.describe BillogramDataProvider do
  it "has a version number" do
    expect(BillogramDataProvider::VERSION).not_to be nil
  end

  describe '.new' do
    it 'returns a new instance of BillogramDataProvider::Provider' do
      provider = BillogramDataProvider.new(username: 'username', password: 'password')

      expect(provider.class).to eq(BillogramDataProvider::Provider)
    end
  end
end
