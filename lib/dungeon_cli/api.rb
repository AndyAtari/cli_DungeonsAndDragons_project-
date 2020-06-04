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
        selected_race = Race.find_by_name(name)
        res = RestClient.get(BASE_RACES_URL + name)
        data = JSON.parse(res.body)  
        bio = {"speed" => data["speed"], 
            "ability" => (data["ability_bonuses"].map {|ability| ability["name"]}).join(', '),
            "bonus" =>  (data["ability_bonuses"].map {|ability| ability.dig("bonus")}).join(', '),
            "alignment" => data["alignment"], "age" => data["age"], "size" => data["size"],
            "size description" => data["size_description"], 
            "starting proficiencies" => (data["starting_proficiencies"].map {|p| p.dig("name")}).join(', '),
            "languages" => (data["languages"].map {|l| l.dig("name")}).join(', '),
            "language description" => data["language_desc"],
            "traits" => (data["traits"].map {|t| t.dig("name")}).join(', ')}
            subrace = (data["subraces"].map {|subrace| subrace.dig("name")}).join(', ')
            selected_race.update(bio, subrace)
            selected_race
    end
end



        
             
    






 