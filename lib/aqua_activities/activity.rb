class AquaActivities::Activity 

    attr_accessor :name, :time, :room 

    @@all = [] 

    def initialize
        @@all << self 
    end

    def self.all
        @@all
    end
    
end
