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
        valid_index?(index)
        binding.pry
    end

    def print_welcome
        puts "Greetings Traveler! Welcome to the Dungeons and Dragons API!"
    end

    def print_all
        Races.all.each {|race| puts "#{race.index}"}    
    end

    def print_selection
        puts "Please choose the desired Race for more lore:"
    end

    def print_invalid_selection
        puts "I am sorry friend, that is an invalid Race. Please choose wisely:"
    end

    def user_selection 
        gets.chomp 
    end

    def valid_index?(index) 
        case index
            
    end
end
