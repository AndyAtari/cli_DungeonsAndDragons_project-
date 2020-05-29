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
        update = get_race_details(index)
        print_details(update)
        print_continue
        continue?(user_selection)
    end

    def print_welcome
        puts "Greetings Traveler! Welcome to the Dungeons and Dragons API!"
    end

    def print_all
        Races.all.each {|race| puts race.index}    
    end

    def print_selection
        puts "Please choose the desired Race for more lore:"
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
        case index 
        when "dragonborn"
            puts "Ah...the Dragonborn"
        when "dwarf"
            puts "Ah...the Dwarf"
        when "elf"
            puts "Ah...the Elf"
        when "gnome"
            puts "Ah...the Gnome"
        when "half-elf"
            puts "Ah...the Half-Elf"
        when "half-orc"
            puts "Ah...the Half-Orc"
        when "halfling"
            puts "Ah...the Halfling"
        when "human"
            puts "Ah...the Human"
        when "tiefling"
            puts "Ah...the Tiefling"
        else 
            print_invalid_selection
            sleep 1
            main
        end
    end

    def continue?(choice)
        if choice == "yay"
            main
        else
            print_bye
            exit 
        end
    end
    
    def get_race_details(index)
        selected_race = Races.find_by_index(index)
        Api.get_details_by_index(index) unless selected_race.has_details?
        selected_race 
    end

    
    

end
