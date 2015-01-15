module TrackerApi
  module Endpoints
    class Webhooks
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def all(project_id, params={})
        data = client.paginate("/projects/#{project_id}/webhooks", params: params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of webhooks expected' unless data.is_a? Array

        data.map do |story|
          Resources::Webhook.new({ project_id: project_id }.merge(story))
        end
      end

      def get(project_id, id)
        data = client.get("/projects/#{project_id}/webhooks/#{id}").body

        Resources::Webhook.new({ project_id: project_id }.merge(data))
      end

      def create(project_id, params)
        data = client.post("/projects/#{project_id}/webhooks", params: params).body

        Resources::Webhook.new({ }.merge(data))
      end

      def update(project_id, id, params)
        data = client.put("/projects/#{project_id}/webhooks/#{id}", params: params).body

        Resources::Webhook.new({ }.merge(data))
      end

      def delete(project_id, id)
        client.delete("/projects/#{project_id}/webhooks/#{id}").body
      end
    end
  end
end
