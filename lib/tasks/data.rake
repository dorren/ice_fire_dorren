namespace :data do
  desc "import data from api"
  task import: :environment do
    houses = GameOfThronesApi.get_houses
    houses.each do {|house|
      
    }
  end

end
