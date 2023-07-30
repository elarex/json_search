require "rspec/autorun"
require "./client"

describe Client do

  describe "attributes" do
    it {is_expected.to respond_to(:id)}
    it {is_expected.to respond_to(:full_name)}
    it {is_expected.to respond_to(:email)}
  end

  describe ".initializer" do
    it ""
  end

  describe ".to_s" do
    it "joins the attributes" do
      client = Client.new()
      expected = "id: , full_name: , email: "
      expect(client.to_s).to eq(expected)
    end
  end

end