Hi, welcome to the Aqua_Activities Gem! Using this gem will provide the user with details from The Dallas World Aquarium Feeding and Talks page. Details from this app include activity name, activity time and activity room. To run the application, run bin/aqua_activities.rb in the console. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'aqua_activities'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install aqua_activities

## Usage

Execute bin/aqua_activities.rb to run Aqua_Activities. 

A greeting will appear followed by a menu. 
The main menu will read 3 different options and prompt the user to input a number. The user may choose to view an activity list by activity name or activity time. The menu also provides an exit option.  
    puts "Enter 1 to view all activity names"
    puts "Enter 2 to view all activity times"
    puts "Enter 3 to exit"

The second menu will be a numbered list of activity names or times depending on user input. The menu will prompt the user to enter a number to view additional details of the activity name or time. Details include activity time, activity name and activity room. 

The details will appear on the screen and the user will be redirected back to the main menu. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/aqua_activities.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
