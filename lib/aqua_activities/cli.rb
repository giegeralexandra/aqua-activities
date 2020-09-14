#require 'pry'
#require_relative './activitytime.rb'
#require_relative './activity.rb'
#require_relative './scraper'

class AquaActivities::CLI 

    attr_accessor :name 

    def initialize(name = "guest")
        @name = name 
        Scraper.new.make_activity
        greeting 
    end

    def greeting 
        puts 
        puts "Hello #{name}! Welcome to The Dallas World Aquarium Feeding and Talks app!"
        puts "Activities are currently closed but please check out what we will have available soon."
        puts 
        main_menu
    end

    def main_menu
        puts "Would you like to view Activities by time or animal? Please input a number from the below options."
        puts "Enter 1 to view all activity options."
        puts "Enter 2 to view all activity times."
        puts "Enter 3 to exit."
        input = input_to_integer 
        if input == 1
            activity_menu 
        elsif input == 2
            time_menu 
        elsif input == 3
            exit_game 
        else 
            puts 
            puts "Invalid menu option."
            main_menu
        end
    end

    def input_to_integer
        gets.strip.to_i
    end

    def activity_menu 
        puts 
        puts "Please input a number from the options below to view the time and room of the activity chosen."
        Activity.all.each.with_index(1) do |activity, i|
            puts "Enter #{i} for #{activity.name}"
        end
        new_input = input_to_integer
        if valid_activity_option?(new_input)
            print_activity_details(new_input)
        else 
            puts "Invalid menu option."
            activity_menu 
        end
    end

    def time_menu 
        puts 
        puts "Please input a number from the options below to view the activity and room of the time chosen."
        ActivityTime.all.each.with_index(1) do |time, i|
            puts "Enter #{i} for #{time.time}"
        end
        new_input = input_to_integer
        if valid_time_option?(new_input)
            print_time_details(new_input)
        else 
            puts "Invalid menu option"
            time_menu
        end
    end

    def valid_activity_option?(user_input)
        user_input <= Activity.all.length 
    end

    def valid_time_option?(user_input)
        user_input <= ActivityTime.all.length
    end

    def print_activity_details(user_input)
        chosen_activity = Activity.all[(user_input)-1]
        puts 
        puts "Activity: #{chosen_activity.name}"
        puts "  Time: #{chosen_activity.time}"
        puts "  Room: #{chosen_activity.room}"
        puts 
        main_menu
    end

    def print_time_details(user_input)
        chosen_time = ActivityTime.all[(user_input)-1]
        puts 
        puts "Time: #{chosen_time.time}"
        puts "  Activity: #{chosen_time.namel}"
        puts "  Room: #{chosen_time.room}"
        puts 
        main_menu
    end

    def exit_game 
        puts
        puts "Thank you. See you again soon, #{name}!"
        exit 
    end

end