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
        valid_call(index)
        index = chosen_race(index)
        Api.get_details_by_index(index)
        get_race_details(index)  
        print_details(update)
        print_continue
        continue?(user_selection)
    end

    def print_welcome
        puts "Greetings Traveler! Welcome to the Dungeons and Dragons API!"
    end

    def print_all
        Race.all.each.with_index(1) {|race, index| puts "#{index}: #{race.name}"}    
    end

    def print_selection
        puts "Please choose the number of the desired Race for more lore:"
    end

    def print_invalid_selection
        puts "I am sorry friend, that is an invalid Race. Please choose wisely:"
    end

    def print_details(race)
        puts "Name: #{race.name}" 
        puts "Speed: #{race.speed}".red 
        puts "Alignment: #{race.alignment}".green 
        puts "Age: #{race.age}".yellow
        puts "Size: #{race.size_stat}".blue
        puts "Size Description: #{race.size_description}".light_blue
    end

    def print_continue
        puts "Would you like to continue traveler? (yay/nay)"
    end

    def print_bye
        puts "Farewell! I'll be awaiting your arrival in the realm."
    end

    def user_selection 
        gets.chomp 
    end

    def valid_call(index)
        index = index.to_i 
        if index < 1 || index > Race.all.size 
            print_invalid_selection
            sleep 1
            main
        end
        index
    end

    def chosen_race(index)
        input = index.to_i 
        index = Race.all.map{|race| race.name}[input - 1]
        index  
    end
    

    def continue?(choice)
        if choice == "yay"
            main
        else
            print_bye
            exit 
        end
    end
    
    def get_race_details(selected_race)
        selected_race = Race.find_by_name(name)
        Api.get_details_by_index(selected_race) unless selected_race.has_details?
        selected_race 
    end

    
    

end

#once number selection is validated..
# looks up corresponding object in Race.all using index number => if user selects 5, you would find Race.all[4]
# once you have found the object and have a reference to it, you'll then have access to the race.name property
# .name property can be pass to a method to print puts "Ah...the #{name.upcase}"
# .name can also then be passed to Api to call for add. details
