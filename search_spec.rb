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
  describe ".find_by" do
    it "compares partial strings" do
      entry = Object.new
      allow(entry).to receive(:full_name).and_return("something")
      another = Object.new
      allow(another).to receive(:full_name).and_return("something else")
      search = Search.new(list: [entry, another])
      expect(search.send(:find_by, key: :full_name, query: "thing")).to eq([entry, another])
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
end

