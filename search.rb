class Search
  # some place to store the data we search through
  attr_accessor :dataset

  def initialize(list: [])
    self.dataset = list
  end

  def find(key: , query:)
    if valid_key?(key)
      return find_by(key: key, query: query)
    end
    []
  end

  private

  def find_by(key:, query:)
    matches = self.dataset.select{ |entry|
      value = entry.send(key)
      # deal with different types
      if value.is_a?(String)
        value.downcase.include?(query)
      elsif value.is_a?(Integer)
        value == query.to_i
      end
    }
    return matches
  end

  def valid_key?(key)
    dataset.first.respond_to?(key)
  end

end