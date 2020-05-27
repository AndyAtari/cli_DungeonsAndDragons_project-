class Races
    attr_accessor :index, :name, :id 
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




end