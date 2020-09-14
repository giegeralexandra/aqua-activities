#require 'pry'
#require 'nokogiri'
#require 'open-uri'
#require_relative './activity.rb'
#require_relative './activitytime.rb'

class Scraper

    def get_page
        doc = Nokogiri::HTML(open("https://dwazoo.com/feeding-and-talks/"))
    end

    def get_activity
        self.get_page.css(".wpb_wrapper p")
    end

    def make_activity
        self.get_activity.each do |activity|
            if activity.text.include?("Crocodiles")
                array = activity.text.split(" – ")
                new_activity = Activity.new 
                new_time = ActivityTime.new 
                new_time.name = array[0].split("are").first.strip + " Feeding"
                new_time.time = "Saturdays only at " + array[1].strip
                new_time.room = "Unknown"
                new_activity.name = array[0].split("are").first.strip + " Feeding"
                new_activity.time = "Saturdays only at " + array[1].strip
                new_activity.room = "Unknown"
            else 
                array = activity.text.split(/[()–]/)
                new_activity = Activity.new
                new_time = ActivityTime.new 
                new_time.time = array[0].strip
                new_activity.time = array[0].strip
                if array[2] == nil 
                    new_activity.room = "Unknown"
                    new_time.room = "Unknown"
                else 
                    new_activity.room = array[2].strip 
                    new_time.room = array[2].strip 
                end
                if activity.text.include?("Talk")
                    new_activity.name = array[1].strip
                    new_time.name = array[1].strip
                else 
                    new_activity.name = array[1].strip + " Feeding"
                    new_time.name = array[1].strip + " Feeding"
                end
            end
        end
    end
    

    #def print_activity
        #self.make_activity 
        #Activity.all.each do |activity|
            #puts "Activity: #{activity.animal}"
            #puts "  Time: #{activity.time}"
            #puts "  Room: #{activity.room}"
        #end
    #end

end