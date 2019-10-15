# d2_compare

Used to compare Destiny 2 MobileWorldContentFile between seasons.

## Checklists

Currently, the MobileWorldContents file contains 13 Checklists. Each Checklist contains an "entries" array that contains each of the items or activities in that checklist, as well as a "displayProperties" array that contain... _displayProperties_.:

- Ghost Lore _(displayProperties, [entries], [entries]hash, [entries][displayproperties], [entries]destinationHash, [entries]bubbleHash)_
- The Journals of Cayde-6
- Corrupted Eggs
- Cat Statues
- Latent Memories
- Lost Sectors
- Adventures
- Year 1 DLC Raid Lairs
- Sleeper Nodes
- Ahamkara Bones
- Region Chests

To use or pull entries from a Checklist, you can do the follow:

```ruby
require 'dotenv/load'

require_relative './app/d2/checklists.rb'

include CheckList

CheckList::ghost_lore.each do |list|
    puts list["displayProperties"]["name"]
    puts list["displayProperties"]["description"]
    list['entries'].each do |entry|
        puts entry['displayProperties']['name']
    end
end
```
