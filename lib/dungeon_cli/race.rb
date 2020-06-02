class Race
    attr_accessor :name, :speed, :ability, :bonus, :alignment, :age, :size_stat, :size_desc, :starting_prof, :languages, :language_desc, :traits, :subraces
    @@all = []

    def initialize(name)
        @name = name
        @@all << self 
    end

    def self.all
        @@all 
    end

    def self.find_by_name(name)
       self.all.detect{|race| race.name == name}
    end

    def update(speed, ability, bonus, alignment, age, size_stat, size_desc, starting_prof, languages, language_desc, traits, subraces)
        self.speed = speed
        self.ability = ability
        self.bonus = bonus 
        self.alignment = alignment 
        self.age = age 
        self.size_stat = size_stat 
        self.size_desc = size_desc
        self.starting_prof = starting_prof
        self.languages = languages
        self.language_desc = language_desc
        self.traits = traits 
        self.subraces = subraces 
    end

    def has_details?
        speed && ability && bonus && alignment && age && size_stat && size_desc && starting_prof && languages && language_desc && traits && subraces 
    end
    
end