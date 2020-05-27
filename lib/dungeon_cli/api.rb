class Api

    BASE_RACES_URl = 'http://www.dnd5eapi.co/api/races'

    def self.get_races
       res = RestClient.get(BASE_RACES_URl)
       data = JSON.parse(res.body)
       data["results"].each do |race|
        index = race["index"]
        name = race["name"]
        id = race["url"].split("/")[-1]
        Races.new(index, name, id)
        end
    end
end

 