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

    def main_menu
        puts "Would you like to view Activities by time or name? Please input a number from the below options."
        puts "Enter 1 to view all activity names."
        puts "Enter 2 to view all activity times."
        puts "Enter 3 to exit."
        input = gets.strip.to_i
        if input == 1
            activity_menu 
        elsif input == 2
            time_menu 
        elsif input == 3
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
        new_input = gets.strip.to_i
        if new_input == (AquaActivities::Activity.all.length+1)
            print_all_activities_details
        elsif valid_activity_option?(new_input)
            print_activity_details(new_input)
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
        new_input = gets.strip.to_i
        if new_input == (AquaActivities::ActivityTime.all.length+1)
            print_all_times_details
        elsif valid_time_option?(new_input)
            print_time_details(new_input)
        else 
            puts "\nInvalid menu option"
            time_menu
        end
    end

    def valid_activity_option?(user_input)
        user_input <= AquaActivities::Activity.all.length 
    end

    def valid_time_option?(user_input)
        user_input <= AquaActivities::ActivityTime.all.length
    end

    def print_activity_details(user_input)
        chosen_activity = AquaActivities::Activity.all[(user_input)-1]
        puts "\nActivity: #{chosen_activity.name}"
        puts "  Time: #{chosen_activity.time}"
        puts "  Room: #{chosen_activity.room}\n\n"
        main_menu
    end

    def print_time_details(user_input)
        chosen_time = AquaActivities::ActivityTime.all[(user_input)-1]
        puts "\nTime: #{chosen_time.time}"
        puts "  Activity: #{chosen_time.name}"
        puts "  Room: #{chosen_time.room}\n\n"
        main_menu
    end

    def print_all_activities_details
        AquaActivities::Activity.all.each do |activity|
            puts "\nActivity: #{activity.name}"
            puts "  Time: #{activity.time}"
            puts "  Room: #{activity.room}\n\n"
        end
        main_menu
    end

    def print_all_times_details
        AquaActivities::ActivityTime.all.each do |time|
            puts "\nTime: #{time.time}"
            puts "  Activity: #{time.name}"
            puts "  Room: #{time.room}\n\n"
        end
        main_menu
    end

    def exit_game 
        puts "\nThank you. See you again soon, #{name}!\n\n"
        exit 
    end

end