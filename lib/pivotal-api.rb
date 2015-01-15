require_relative './pivotal_api/version.rb'

# dependencies
require 'virtus'
require 'faraday'
require 'faraday_middleware'

# stdlib
require 'addressable/uri'
require 'forwardable'
require 'logger'

module PivotalApi
  autoload :Error, 'pivotal_api/error'
  autoload :Client, 'pivotal_api/client'
  autoload :Logger, 'pivotal_api/logger'

  module Errors
    class UnexpectedData < StandardError; end
  end

  module Endpoints
    autoload :Comments, 'pivotal_api/endpoints/comments'
    autoload :Epics, 'pivotal_api/endpoints/epics'
    autoload :Iterations, 'pivotal_api/endpoints/iterations'
    autoload :Labels, 'pivotal_api/endpoints/labels'
    autoload :Me, 'pivotal_api/endpoints/me'
    autoload :Memberships, 'pivotal_api/endpoints/memberships'
    autoload :Projects, 'pivotal_api/endpoints/projects'
    autoload :Stories, 'pivotal_api/endpoints/stories'
    autoload :Tasks, 'pivotal_api/endpoints/tasks'
    autoload :Webhooks, 'pivotal_api/endpoints/webhooks'
  end

  module Resources
    autoload :Account, 'pivotal_api/resources/account'
    autoload :Comment, 'pivotal_api/resources/comment'
    autoload :Epic, 'pivotal_api/resources/epic'
    autoload :Iteration, 'pivotal_api/resources/iteration'
    autoload :Me, 'pivotal_api/resources/me'
    autoload :MembershipSummary, 'pivotal_api/resources/membership_summary'
    autoload :Label, 'pivotal_api/resources/label'
    autoload :Person, 'pivotal_api/resources/person'
    autoload :Project, 'pivotal_api/resources/project'
    autoload :ProjectMembership, 'pivotal_api/resources/project_membership'
    autoload :Story, 'pivotal_api/resources/story'
    autoload :Task, 'pivotal_api/resources/task'
    autoload :TimeZone, 'pivotal_api/resources/time_zone'
    autoload :Webhook, 'pivotal_api/resources/webhook'
  end
end
