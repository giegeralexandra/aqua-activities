class AquaActivities::CLI 

    attr_accessor :name 

    def initialize(name = "Guest")
        @name = name 
        AquaActivities::Scraper.new.make_activity
        greeting 
    end

    def greeting 
        puts "\nHello #{name}! Welcome to The Dallas World Aquarium Feeding and Talks App!"
        puts "Activities are currently closed but please check out what we will have available soon.\n\n"
        main_menu
    end

    def get_input_to_integer
        gets.strip.to_i 
    end

    def valid_activity_option?(user_input)
        user_input <= AquaActivities::Activity.all.length 
    end

    def valid_time_option?(user_input)
        user_input <= AquaActivities::ActivityTime.all.length
    end

    def main_menu
        puts "Would you like to view Activities by time or name? Please input a number from the below options."
        puts "Enter 1 to view all activity names"
        puts "Enter 2 to view all activity times"
        puts "Enter 3 to exit"
        
        user_input = get_input_to_integer
        if user_input == 1
            activity_menu 
        elsif user_input == 2
            time_menu 
        elsif user_input == 3
            exit_game 
        else 
            puts "\nInvalid menu option."
            main_menu
        end
    end

    def activity_menu 
        puts "\nPlease input a number from the options below to view the time and room of the activity chosen."
        
        AquaActivities::Activity.all.each.with_index(1) do |activity, i|
            puts "Enter #{i} for #{activity.name}"
        end
        puts "Enter #{AquaActivities::Activity.all.length+1} for all activities and details"
        
        user_input = get_input_to_integer
        if user_input == (AquaActivities::Activity.all.length+1)
            AquaActivities::Activity.print_all_activities_details
            main_menu
        elsif valid_activity_option?(user_input)
            AquaActivities::Activity.all[user_input].print_activity_details(user_input)
            main_menu
        else 
            puts "\nInvalid menu option."
            activity_menu 
        end
    end

    def time_menu 
        puts "\nPlease input a number from the options below to view the activity and room of the time chosen."
        
        AquaActivities::ActivityTime.all.each.with_index(1) do |time, i|
            puts "Enter #{i} for #{time.time}"
        end
        puts "Enter #{AquaActivities::ActivityTime.all.length+1} for all times and details"
        
        user_input = get_input_to_integer
        if user_input == (AquaActivities::ActivityTime.all.length+1)
            AquaActivities::ActivityTime.print_all_times_details
            main_menu 
        elsif valid_time_option?(user_input)
            AquaActivities::ActivityTime.all[user_input].print_time_details(user_input)
            main_menu 
        else 
            puts "\nInvalid menu option"
            time_menu
        end
    end

    def exit_game 
        puts "\nThank you. See you again soon, #{name}!\n\n"
        exit 
    end

end