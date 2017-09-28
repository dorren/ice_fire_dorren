namespace :data do
  desc "import data from api"
  task import_all: :environment do
    Rake::Task["data:import_houses"].invoke
    Rake::Task["data:import_characters"].invoke
  end

  desc "import houses"
  task import_houses: :environment do
    ApplicationRecord.connection.execute("TRUNCATE houses")

    houses = GameOfThronesApi.get_houses
    houses.each {|h|
      h["url"] =~ /(\d+)$/
      house = House.new(id: $1.to_i, name: h["name"])
      house.save!
    }
    puts "imported #{House.count} houses"
  end

  desc "import characters"
  task import_characters: :environment do
    ApplicationRecord.connection.execute("TRUNCATE characters")

    characters = GameOfThronesApi.get_characters
    characters.each {|c|
      c["url"] =~ /(\d+)$/
      char = Character.new(id: $1.to_i, name: c["name"])

      year = c["born"]
      if(year =~ /(\d+) AC/) then
        char.birth_year = $1.to_i
      elsif (year =~ /(\d+) BC/) then
        char.birth_year = -$1.to_i
      end
      char.save!
      
      c["allegiances"].each{|url|
        url =~ /(\d+)$/
        membership = Membership.create(character_id:char.id, house_id: $1.to_i)
      }
    }
    puts "imported #{Character.count} characters"
  end
end
