class Search
  # some place to store the data we search through
  attr_accessor :dataset

  def initialize(list: [])
    self.dataset = list
  end

  def find(query)
    matches = self.dataset.select{ |entry|
      entry.full_name.downcase.include?(query)
    }
    return matches
  end

end