require "rspec/autorun"
require "./client"

describe Client do

  describe "attributes" do
    it {is_expected.to respond_to(:id)}
    it {is_expected.to respond_to(:full_name)}
    it {is_expected.to respond_to(:email)}
  end

  describe ".initializer" do
    it "takes an optional set of attributes" do
      expect(Client.new()).to_not be_nil
    end

    it "sets the attributes provided" do
      example = {id: 1, full_name: "test", email: "email@example.com"}
      client = Client.new(example)
      expect(client.full_name).to eq(example[:full_name])
      expect(client.email).to eq(example[:email])
      expect(client.id).to eq(example[:id])
    end
  end

  describe ".to_s" do
    it "joins the attributes" do
      client = Client.new()
      expected = "id: , full_name: , email: "
      expect(client.to_s).to eq(expected)
    end
  end

end