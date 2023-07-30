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

  describe ".find_by" do
    it "compares partial strings" do
      entry = Object.new
      allow(entry).to receive(:full_name).and_return("something")
      another = Object.new
      allow(another).to receive(:full_name).and_return("something else")
      search = Search.new(list: [entry, another])
      expect(search.send(:find_by, key: :full_name, query: "thing")).to eq([entry, another])
    end
  end
end

