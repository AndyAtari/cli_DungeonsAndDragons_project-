class Cli 

    def run
        print_welcome
        Api.get_races
        main
 
    end

    def main
        print_all
        print_selection 
        index = user_selection  
        name = valid_call(index)
        update = get_race_details(name)  
        print_details(update)
        print_continue
        continue?(user_selection)
    end

    def print_welcome
        puts "Greetings Traveler! Welcome to the Dungeons and Dragons CLI Adventure!".red 
    end

    def print_all
        Race.all.each.with_index(1) {|race, index| puts Rainbow("#{index}: #{race.name.upcase}").orangered}    
    end

    def print_selection
        puts Rainbow("Please choose the number of the desired race for more lore:").gold 
    end

    def print_invalid_selection
        puts Rainbow("I am sorry friend, that is an invalid race. Please choose wisely:").violet 
    end

    def print_details(race)
        puts Rainbow("NAME: #{race.name.upcase}").olive     
        race.bio.each{|k,v| puts Rainbow("#{k.upcase}: #{v}").royalblue}
        puts Rainbow("SUBRACE: #{race.subrace}").skyblue 
    end

    def print_continue
        puts Rainbow("Would you like to continue traveler? (Enter 1 for Yay or 2 for Nay)").silver
    end

    def print_bye
        puts Rainbow("Farewell! I'll be awaiting your arrival in the Realm.").crimson 
    end

    def user_selection
        gets.chomp
    end

    def valid_call(index)
         input = index.to_i 
         if input < 1 || input > Race.all.size 
            print_invalid_selection
            sleep 1
            main 
        end
        Race.all.map{|race| race.name}[input - 1]
    end

    def continue?(choice) 
        if choice == "1"
            main
        elsif choice == "2"
            print_bye
            exit 
        else
            puts Rainbow("I am sorry Dave, I'm afraid I can't do that.").darkgray 
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


