class AquaActivities::ActivityTime

    attr_accessor :name, :time, :room 

    @@all = [] 

    def initialize
        @@all << self 
    end

    def self.all
        @@all
    end

    def print_time_details(user_input)
        chosen_time = @@all[user_input-1]
        puts "\nTime: #{chosen_time.time}"
        puts "  Activity: #{chosen_time.name}"
        puts "  Room: #{chosen_time.room}\n\n"
    end


    def self.print_all_times_details
        @@all.each do |time|
            puts "\nTime: #{time.time}"
            puts "  Activity: #{time.name}"
            puts "  Room: #{time.room}\n\n"
        end
    end
   
end