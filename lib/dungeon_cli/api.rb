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
        res = RestClient.get("#{BASE_RACES_URL}#{index}")
        data = JSON.parse(res.body)
    end
end



 