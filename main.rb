
require "./client.rb"
require "./search.rb"

class Crm

  def self.run()
    Client.load('clients.json')
  end


end


Crm.run()

