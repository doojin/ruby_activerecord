require './model/location_metadata'
require './model/location'

db_config = {
    :adapter => 'mysql2',
    :host => 'localhost',
    :username => 'root',
    :password => '',
    :database => 'project_activerecord'
}

ActiveRecord::Base.establish_connection(db_config)

Location.destroy_all

latvia = Location.new(name: 'Latvia')
latvia.metadata = LocationMetadata.new(description: 'Latvia is a small Baltic country')
latvia.save

riga = Location.new(name: 'Riga', parent_location: latvia)
riga.save

latgale = Location.new(name: 'Latgale', parent_location: latvia)
latgale.save

daugavpils = Location.new(name: 'Daugavpils', parent_location: latgale)
daugavpils.metadata = LocationMetadata.new(description: 'Daugavpils is a second big city of Latvia')
daugavpils.save

kraslava = Location.new(name: 'Kraslava', parent_location: latgale)
kraslava.save

locations = Location.all.sort
locations.each do |location|
  output = location.name
  output += location.locations.empty? ? ' | no child locations' : " | (#{location.locations.map{ |l| l.name }.join(', ')})"
  output += " | #{location.metadata.description}" unless location.metadata.nil?
  puts output
end



