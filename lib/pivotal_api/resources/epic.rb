module PivotalApi
  module Resources
    class Epic
      include Virtus.model

      # attribute :client

      attribute :id, Integer
      attribute :created_at, DateTime
      attribute :description, String
      attribute :kind, String
      attribute :label, PivotalApi::Resources::Label
      attribute :name, String
      attribute :project_id, Integer
      attribute :updated_at, DateTime
      attribute :url, String
    end
  end
end
