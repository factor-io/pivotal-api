# PivotalApi

This gem allows you to easily use the [Pivotal Tracker v5 API](https://www.pivotaltracker.com/help/api/rest/v5).

It’s powered by [Faraday](https://github.com/lostisland/faraday) and [Virtus](https://github.com/solnic/virtus).

##Demonstration
[Factor.io](https://factor.io/) uses `pivotal-api` to enable DevOps engineers to automate workflows with Pivotal Tracker.

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'pivotal-api', '~> 0.3.0'
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install pivotal-api
```

## Basic Usage

```ruby
client = PivotalApi::Client.new(token: 'my-api-token')                    # Create API client

user_email = client.me.email                                              # Get authenticated user's email

require 'pivotal-api'
require 'awesome_print'

client = PivotalApi::Client.new token: ENV['PIVOTAL_TRACKER_API_KEY']

projects = client.projects.all                                                    # Get all projects
project  = client.projects.get(123456)                                            # Find project with given ID

client.projects.stories.all 12345                                                 # Get all stories for a project
client.projects.stories.all 12345, with_state: :unscheduled, limit: 10            # Get 10 unscheduled stories for a project
client.projects.stories.all 12345, filter: 'requester:OWK label:"jedi stuff"'     # Get all stories that match the given filters
client.projects.stories.get 12345, 847762630                                      # Find a story with the given ID
client.projects.stories.create 12345, name: 'Destroy death star'                    # Create a story with the name 'Destroy death star'
client.projects.stories.get 12345, 4235423

client.projects.stories.tasks.all 12345, 85721980
client.projects.stories.tasks.get 12345, 85721980, 28279392
client.projects.memberships.all 12345
client.projects.memberships.get 12345, 5015540
client.projects.iterations.all 12345

epics = client.projects.epics.all 12345                                           # Get all epics for a project
epic  = epics.first
epic  = client.projects.epics.get 12345, 1603542
label = epic.label                                                                # Get an epic's label
```

## Contributing

Currently this client supports read-only access to Pivotal Tracker.
We will be extending it as our use cases require, but are always happy to accept contributions.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
