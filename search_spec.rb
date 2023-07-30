require "rspec/autorun"
require "./search"

describe Search do

  describe "attributes" do
    it {is_expected.to respond_to(:dataset)}
  end

  describe ".initializer" do
    it "requires a list" do
      expect(Search.new(list: [])).to_not be_nil
    end
  end

  describe ".find" do
    it "checks if its a valid key" do
      entry = Object.new
      search = Search.new(list: [entry])
      expect(search.find(key: 'nonsense', query: 'test')).to eq([])
    end

    it "returns an array" do
      entry = Object.new
      search = Search.new(list: [entry])
      expect(search.find(key: 'to_s', query: 'test')).to eq([])
    end
  end

  #PRIVATE BLOW THIS

  describe ".find_by" do
    it "compares partial strings" do
      entry = Object.new
      allow(entry).to receive(:name).and_return("something")
      another = Object.new
      allow(another).to receive(:name).and_return("something else")
      search = Search.new(list: [entry, another])
      expect(search.send(:find_by, key: :name, query: "thing")).to eq([entry, another])
    end

    it "compares exact integers" do
      entry = Object.new
      allow(entry).to receive(:number).and_return(123)
      another = Object.new
      allow(another).to receive(:number).and_return(1234)
      search = Search.new(list: [entry, another])
      expect(search.send(:find_by, key: :number, query: 123)).to eq([entry])
    end
  end

  describe ".valid_key?" do
    it "returns true if the list entries respond to a key" do
      entry = Object.new
      search = Search.new(list: [entry])
      expect(search.send(:valid_key?, 'nonsense')).to eq(false)
      expect(search.send(:valid_key?, 'to_s')).to eq(true)
    end
  end
end

