# require_relative './lib/pivotal-api.rb'
require 'pivotal-api'
require 'awesome_print'

client = TrackerApi::Client.new(token: ENV['PIVOTAL_TRACKER_API_KEY'])

# ap client.projects.all
# ap client.projects.get(1244700)
# ap client.me
# ap client.projects.epics.all(1244700)
# ap client.projects.epics.get(1244700,1603542)
# ap client.projects.stories.all(1244700)
# ap client.projects.stories.get(1244700,85971684)
# ap client.projects.stories.all(1244700)
# ap client.projects.stories.get(1244700,85971684)
# ap client.projects.stories.tasks.all(1244700,85721980)
# ap client.projects.stories.tasks.get(1244700,85721980,28279392)
# ap client.projects.memberships.all(1244700)
# ap client.projects.memberships.get(1244700,5015540)
# ap client.projects.iterations.all(1244700).last[:number]
# ap client.projects.iterations.all(1244700).last[:number]
ap client.projects.iterations.get(1244700,10)

