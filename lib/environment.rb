require_relative "./aqua_activities/version.rb"
require_relative './aqua_activities/cli.rb'
require_relative './aqua_activities/activity_time.rb'
require_relative './aqua_activities/activity.rb'
require_relative './aqua_activities/scraper.rb'
require_relative './aqua_activities/formatting.rb'
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'


module AquaActivities
  class Error < StandardError; 
  end
end

class String
  def titleize
    self.split(" ").map{|word| word.capitalize}.join(" ")
  end
end



