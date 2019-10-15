require 'mongo'

module CheckList
    def ghost_lore
        Mongo::Logger.level = Logger::FATAL
        client = Mongo::Client.new(ENV['DB_URL'])

        checklists = client[:DestinyChecklistDefinition]

        result = checklists.find({hash: 2360931290.0}, {projection: {displayProperties: 1, entries: 1}})

        client.close

        result
    end
end