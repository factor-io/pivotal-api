module TrackerApi
  module Resources
    class Webhook
      include Virtus.model

      attribute :id, Integer
      attribute :project_id, Integer
      attribute :webhook_url, String
      attribute :webhook_version, String, default: 'v5'
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
      attribute :kind, String

    end
  end
end
