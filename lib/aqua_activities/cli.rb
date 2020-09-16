class AquaActivities::CLI 

    attr_accessor :name 

    def initialize(name = "Guest")
        @name = name 
        AquaActivities::Scraper.new.make_activity
        AquaActivities::Formatting.banner
        greeting 
    end


    def greeting 
        AquaActivities::Formatting.slashes 
        puts "\nHello #{name}! Welcome to The Dallas World Aquarium Feeding and Talks App!"
        puts "Activities are currently closed but please check out what we will have available soon.\n\n"
        main_menu
    end


    def get_input_to_index
        gets.strip.to_i-1 
    end


    def valid_activity_option?(user_input)
        user_input <= AquaActivities::Activity.all.length 
    end


    def valid_time_option?(user_input)
        user_input <= AquaActivities::ActivityTime.all.length
    end


    def main_menu
        AquaActivities::Formatting.slashes 
        puts "Would you like to view Activities by time or name? Please input a number from the below options."
        puts "Enter 1 to view all activity names"
        puts "Enter 2 to view all activity times"
        puts "Enter 3 to exit"
        
        user_input = gets.strip.to_i 
        if user_input == 1
            activity_menu 
        elsif user_input == 2
            time_menu 
        elsif user_input == 3
            exit_game 
        else 
            puts "Invalid menu option.".colorize(:red)
            main_menu
        end
    end


    def activity_menu 
        AquaActivities::Formatting.slashes 
        puts "\nPlease input a number from the options below to view the time and room of the activity chosen."
        activities = AquaActivities::Activity.all.collect{|activity| activity.name}.uniq
        activities.each.with_index(1) do |activity, i|
            puts "Enter #{i} for #{activity}"
        end
        puts "Enter #{activities.length+1} for All Activities and Details"
        
        user_input = get_input_to_index
        if user_input == (activities.length)
            AquaActivities::Formatting.slashes 
            AquaActivities::Activity.print_all_activities_details
            main_menu
        elsif valid_activity_option?(user_input)
            activity_name = activities[user_input]
            print_activity_details(activity_name)
            main_menu
        else 
            puts "Invalid menu option.".colorize(:red)
            activity_menu 
        end
    end


    def time_menu 
        AquaActivities::Formatting.slashes 
        puts "\nPlease input a number from the options below to view the activity and room of the time chosen."
        times = AquaActivities::ActivityTime.all.collect{|time| time.name}.uniq
        times.each.with_index(1) do |name, i|
            puts "Enter #{i} for #{name}"
        end
        puts "Enter #{times.length+1} for all times and details"
        
        user_input = get_input_to_index
        if user_input == (times.length)
            AquaActivities::Formatting.slashes 
            AquaActivities::ActivityTime.print_all_times_details
            main_menu 
        elsif valid_time_option?(user_input)
            time = times[user_input]
            print_time_details(time)
            main_menu 
        else 
            puts "Invalid menu option".colorize(:red)
            time_menu
        end
    end


    def print_activity_details(activity_name)  
        AquaActivities::Formatting.slashes       
        AquaActivities::Activity.all.each do |activity|
            if activity.name == activity_name
                puts "\nActivity: #{activity.name}"
                puts "  Time: #{activity.time}"
                puts "  Room: #{activity.room}\n\n"
            end
        end
    end


    def print_time_details(activity_time)
        AquaActivities::Formatting.slashes 
        AquaActivities::ActivityTime.all.each do |time|
            if time.name == activity_time 
                puts "\nTime: #{time.name}"
                puts "  Activity: #{time.activity}"
                puts "  Room: #{time.room}\n\n"
            end
        end
    end


    def exit_game 
        AquaActivities::Formatting.slashes 
        puts "\nThank you. See you again soon, #{name}!\n\n".colorize(:red)
        exit 
    end

end