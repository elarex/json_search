
require "./client.rb"
require "./search.rb"

class Crm

  def self.run()
    # NOTE: default is to use the one we were given to save time, we can load another one
    clients = Client.load('clients.json')

    instructions()

    while (cmd = readline().strip)
      case cmd
      when 'load'
        filename = readline().strip
        clients = Client.load(filename)
      when 'search'
      else
        return
      end
    end
  end

  private

  def self.instructions
    p "Commands are load, search. Anything else quits."
  end

end


Crm.run()

