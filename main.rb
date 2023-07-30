
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
        p "loaded #{clients.length} records..."
      when 'search'
        search = Search.new(list: clients)
        p "Search syntax is key:value e.g. full_name:Jane"
        input = readline()
        key, query = input.split(":")

        results = search.find(key: key.downcase.strip, query: query.downcase.strip)
        results.each do |result|
          p "match found: #{result.to_s}"
        end
      when 'bye'
        return
      else
        search = Search.new(list: clients)
        # not very efficient, but I didn't want to leak acstraction into the search class. Main knowing about what clients are is fine.
        results = search.find(key: :full_name, query: cmd.downcase.strip)
        results += search.find(key: :email, query: cmd.downcase.strip)
        results.uniq!
        results.each do |result|
          p "match found: #{result.to_s}"
        end
      end
      instructions()
    end
  end

  private

  def self.instructions
    p "Commands are load, search, bye. Anything else searches broadly"
  end

end


Crm.run()

