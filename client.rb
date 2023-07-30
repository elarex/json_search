require "json"

class Client
  # attrs defined in the json.
  attr_accessor :id, :full_name, :email

  # we will likely need one
  def initialize(attrs={})
    if attrs.is_a?(Hash)
      converted = attrs.transform_keys(&:to_sym)
      self.id = converted[:id]
      self.full_name = converted[:full_name]
      self.email = converted[:email]
    end
  end

  # a way to see what we are dealing with
  def to_s
    # TODO: see if there is a dynamic way to do this.
    [:id, :full_name, :email].map{|k|
      "#{k}: #{self.send(k)}"
    }.join(', ')
  end

  # load from json
  def self.load(filename)
    loaded = JSON.parse(File.read(filename))
    loaded.map do |client_record|
      self.new(client_record)
    end
  end

end