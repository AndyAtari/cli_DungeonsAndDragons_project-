class Race
    attr_accessor :name, :bio, :subrace
    
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

    def update(bio, subrace)
        self.bio = bio 
        self.subrace = subrace 
    end

    def has_details?
        bio && subrace 
    end
    
end