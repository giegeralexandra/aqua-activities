class AquaActivities::Activity 

    attr_accessor :name, :time, :room 
    @@all = [] 

    
    def initialize
        @@all << self 
    end


    def self.all
        @@all
    end

    def self.print_all_activities_details
        @@all.each do |activity|
            puts "\nActivity: #{activity.name}"
            puts "  Time: #{activity.time}"
            puts "  Room: #{activity.room}\n\n"
        end
    end
end
