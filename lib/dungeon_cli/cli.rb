class Cli 

    def run
        print_welcome
        Api.get_races
        main
 
    end

    def main
        print_all
        print_selection 
        name = user_race_selection  
        valid_call(name)
        update = get_race_details(name)  
        print_details(update)
        print_continue
        continue?(user_selection)
    end

    def print_welcome
        puts "Greetings Traveler! Welcome to the Dungeons and Dragons API!"
    end

    def print_all
        Race.all.each.with_index(1) {|race, index| puts "#{index}: #{race.name.upcase}"}    
    end

    def print_selection
        puts "Please choose the number of the desired Race for more lore:"
    end

    def print_invalid_selection
        puts "I am sorry friend, that is an invalid Race. Please choose wisely:"
    end

    def print_details(race)
        puts "Name: #{race.name.upcase}".red     
        puts Rainbow("Speed: #{race.speed}").orangered
        #race.speed.each{|k,v| puts "#{k}: #{v}"}
        puts Rainbow("Ability Name: #{race.ability}").gold
        puts Rainbow("Bonus: #{race.bonus}").violet  
        puts Rainbow("Alignment: #{race.alignment}").olive 
        puts Rainbow("Age: #{race.age}").silver
        puts Rainbow("Size: #{race.size_stat}").darkgray
        puts Rainbow("Size Description: #{race.size_desc}").yellowgreen
        puts Rainbow("Starting Proficiencies: #{race.starting_prof}").crimson
        puts Rainbow("Languages: #{race.languages}").saddlebrown
        puts Rainbow("Language Description: #{race.language_desc}").purple 
        puts Rainbow("Traits: #{race.traits}").skyblue
        puts Rainbow("Subraces: #{race.subraces}").royalblue
    end

    def print_continue
        puts "Would you like to continue traveler? (Enter 1 for Yay or 2 for Nay)"
    end

    def print_bye
        puts "Farewell! I'll be awaiting your arrival in the realm."
    end

    def user_selection
        gets.chomp
    end

    def user_race_selection 
        input = gets.chomp.to_i - 1  
        Race.all.map{|race| race.name}[input] 
    end

    def valid_call(name)
        until Race.find_by_name(name)
            print_invalid_selection
            sleep 1
            main 
        end
    end

    def continue?(choice) 
        if choice == "1"
            main
        elsif choice == "2"
            print_bye
            exit 
        else
            puts "I am sorry traveler, I can not do that right now"
            sleep 1
            main
        end
    end
    
    def get_race_details(name)
        selected_race = Race.find_by_name(name)
        Api.get_details_by_name(name) unless selected_race.has_details?
        selected_race 
    end

    
    

end


