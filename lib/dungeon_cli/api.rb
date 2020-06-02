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
        #binding.pry 
        speed = data["speed"]
        ability = (data["ability_bonuses"].map {|ability| ability["name"]}).join(', ')
        bonus = (data["ability_bonuses"].map {|ability| ability.dig("bonus")}).join(', ')
        alignment = data["alignment"]
        age = data["age"]
        size_stat = data["size"]
        size_desc = data["size_description"]
        starting_prof = (data["starting_proficiencies"].map {|p| p.dig("name")}).join(', ')
        languages = (data["languages"].map {|l| l.dig("name")}).join(', ')
        language_desc = data["language_desc"]
        traits = (data["traits"].map {|t| t.dig("name")}).join(', ')
        subraces = (data["subraces"].map {|subrace| subrace.dig("name")}).join(', ')
        selected_race.update(speed, ability, bonus, alignment, age, size_stat, size_desc, starting_prof, languages, language_desc, traits, subraces)
        selected_race
    end
end



        
             
    






 