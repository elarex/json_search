class Search
  # some place to store the data we search through
  attr_accessor :dataset

  def initialize(list: [])
    self.dataset = list
  end

  def find(query)
    if valid_key?(:full_name)
      return find_by(key: :full_name, query: query)
    end
    []
  end

  private

  def find_by(key:, query:)
    matches = self.dataset.select{ |entry|
      entry.send(key).downcase.include?(query)
    }
    return matches
  end

  def valid_key?(key)
    dataset.first.respond_to?(key)
  end

end