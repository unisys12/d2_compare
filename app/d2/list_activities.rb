module ListActivities

    def all
        Mongo::Logger.level = Logger::FATAL
        client = Mongo::Client.new(ENV['DB_URL'])

        activity_defs = client[:DestinyActivityDefinition]

        activity_defs.aggregate([
        { "$match" => { 'isPvP' => false } },
        { 
        "$lookup" => {
            "localField" => "destinationHash",
            "foreignField" => "hash",
            "from" => "DestinyDestinationDefinition",
            "as" => "destination"
            }
        },
        { 
        "$lookup" => {
            "localField" => "placeHash",
            "foreignField" => "hash",
            "from" => "DestinyPlaceDefinition",
            "as" => "place"
        }
        },
        { 
        "$lookup" => {
            "localField" => "activityTypeHash",
            "foreignField" => "hash",
            "from" => "DestinyActivityTypeDefinition",
            "as" => "activityType"
        }
        },
        {
            "$project" => {
                "displayProperties" => 1,
                "destination.displayProperties" => 1,
                "place.displayProperties.name" => 1,
                "activityType.displayProperties.name" => 1
            }
        }
        ]).each do |activity|
            puts activity
        end
    end

end