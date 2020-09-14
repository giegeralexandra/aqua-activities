require_relative "./activities/version.rb"
require_relative './activities/cli.rb'
require_relative './activities/activitytime.rb'
require_relative './activities/activity.rb'
require_relative './activities/scraper.rb'
require 'pry'
require 'nokogiri'
require 'open-uri'


module AquaActivities
  class Error < StandardError; end
  # Your code goes here...
end
