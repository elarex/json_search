class Client

  # attrs defined in the json.
  attr_accessor :id, :full_name, :email

  # we will likely need one
  def initializer()
  end

  # a way to see what we are dealing with
  def to_s
    # TODO: see if there is a dynamic way to do this.
    [:id, :full_name, :email].map{|k|
      "#{k}: #{self.send(k)}"
    }.join(', ')
  end
end