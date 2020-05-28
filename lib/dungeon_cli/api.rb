class Api

    BASE_RACES_URL = 'http://www.dnd5eapi.co/api/races/'

    def self.get_races
       res = RestClient.get(BASE_RACES_URL)
       data = JSON.parse(res.body)
       data["results"].each do |race|
        index = race["index"]
        name = race["name"]
        id = race["url"].split("/")[-1]
        Races.new(index, name, id)
        end
    end

    def self.get_details_by_index(index)
        selected_race = Races.find_by_index(index)
        res = RestClient.get(BASE_RACES_URL + index)
        data = JSON.parse(res.body)
        speed = data["speed"]
        alignment = data["alignment"]
        age = data["age"]
        size_stat = data["size"]
        size_description = data["size_description"]
        selected_race.update(speed, alignment, age, size_stat, size_description)
        binding.pry
        selected_race
    end
end



 