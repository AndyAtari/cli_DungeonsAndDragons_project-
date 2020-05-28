class Races
    attr_accessor :index, :name, :id, :speed, :alignment, :age, :size_stat, :size_description 
    @@all = []

    def initialize(index, name, id)
        @index = index
        @name = name
        @id = id
        @@all << self 
    end

    def self.all
        @@all 
    end

    def self.find_by_index(index)
        self.all.detect{|race| race.index == index}
    end

    def update(speed, alignment, age, size_stat, size_description)
        self.speed = speed
        self.alignment = alignment 
        self.age = age 
        self.size_stat = size_stat 
        self.size_description = size_description
        
    end

end