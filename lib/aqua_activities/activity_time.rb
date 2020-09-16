class AquaActivities::ActivityTime

    attr_accessor :name, :time, :room 
    @@all = [] 


    def initialize
        @@all << self 
    end


    def self.all
        @@all
    end


    def self.print_all_times_details
        @@all.each do |time|
            puts "\nTime: #{time.time}"
            puts "  Activity: #{time.name}"
            puts "  Room: #{time.room}"
        end
    end
   
end