module PivotalApi
  module Resources
    class Iteration
      include Virtus.model

      # attribute :client

      attribute :finish, DateTime
      attribute :kind, String
      attribute :length, Integer
      attribute :number, Integer
      attribute :planned, Boolean
      attribute :project_id, Integer
      attribute :start, DateTime
      attribute :stories, [PivotalApi::Resources::Story]
      attribute :story_ids, [Integer]
      attribute :team_strength, Float
    end
  end
end
