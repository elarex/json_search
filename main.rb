
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
        p "Please specify the JSON filename to load"
        filename = readline().strip
        clients = Client.load(filename)
      when 'search'
        search = Search.new(list: clients)
        input = readline()
        results = search.find(input.downcase.strip)
        results.each do |result|
          p "match found: #{result.to_s}"
        end

        p "No results found" unless results.any?
      else
        return
      end
      instructions()
    end
  end

  private

  def self.instructions
    p "Commands are load, search. Anything else quits."
  end

end


Crm.run()

