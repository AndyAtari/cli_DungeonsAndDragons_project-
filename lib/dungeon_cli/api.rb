class Api

    BASE_RACES_URL = 'http://www.dnd5eapi.co/api/races/'

    def self.get_races
       res = RestClient.get(BASE_RACES_URL)
       data = JSON.parse(res.body)
       data["results"].each do |race|
        name = race["index"]
        Race.new(name)
        end
    end

    def self.get_details_by_name(name)
        puts "getting details"
        selected_race = Race.find_by_name(name)
        res = RestClient.get(BASE_RACES_URL + name)
        data = JSON.parse(res.body)  
        speed = data["speed"]
        alignment = data["alignment"]
        age = data["age"]
        size_stat = data["size"]
        size_description = data["size_description"]
        selected_race.update(speed, alignment, age, size_stat, size_description)
        selected_race
    end
end



 