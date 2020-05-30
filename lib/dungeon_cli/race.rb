class Race
    attr_accessor :name, :speed, :alignment, :age, :size_stat, :size_description 
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

    def update(speed, alignment, age, size_stat, size_description)
        self.speed = speed
        self.alignment = alignment 
        self.age = age 
        self.size_stat = size_stat 
        self.size_description = size_description
    end

    def has_details?
        self.speed && self.alignment && self.age && self.size_stat && self.size_description
    end
    
end