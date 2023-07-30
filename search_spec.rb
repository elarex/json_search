require "rspec/autorun"
require "./search"

describe Search do

  describe ".initializer" do
    it "requires a list" do
      expect(Search.new(list: [])).to_not be_nil
    end
  end


  describe ".find" do
    it "returns an array" do
      entry = Object.new
      allow(entry).to receive(:full_name).and_return('example')
      search = Search.new(list: [entry])
      expect(search.find('test')).to eq([])
    end
  end
end

