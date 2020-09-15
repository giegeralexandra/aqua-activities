class AquaActivities::Scraper

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
                new_activity = AquaActivities::Activity.new 
                new_time = AquaActivities::ActivityTime.new 
                new_activity.name = array[0].split("are").first.strip + " Feeding"
                new_activity.time = "Saturdays only at " + array[1].strip
                new_activity.room = "Unknown"                
                new_time.name = array[0].split("are").first.strip + " Feeding"
                new_time.time = "Saturdays only at " + array[1].strip
                new_time.room = "Unknown"       
            else 
                array = activity.text.split(/[()–]/)
                new_activity = AquaActivities::Activity.new
                new_time = AquaActivities::ActivityTime.new 
                new_activity.time = array[0].strip
                new_time.time = array[0].strip
                
                if activity.text.include?("Talk")
                    new_activity.name = array[1].strip
                    new_time.name = array[1].strip
                else 
                    new_activity.name = array[1].strip + " Feeding"
                    new_time.name = array[1].strip + " Feeding"
                end
                
                if array[2] == nil 
                    new_activity.room = "Unknown"
                    new_time.room = "Unknown"
                else 
                    new_activity.room = array[2].strip.titleize
                    new_time.room = array[2].strip.titleize
                end
            end
        end
    end
end
