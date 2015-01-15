module TrackerApi
  module Endpoints
    class Stories
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def all(project_id, params={})
        data = client.paginate("/projects/#{project_id}/stories", params: params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of stories expected' unless data.is_a? Array

        data.map do |story|
          Resources::Story.new({ project_id: project_id }.merge(story))
        end
      end

      def get(project_id, id)
        data = client.get("/projects/#{project_id}/stories/#{id}").body

        Resources::Story.new({ project_id: project_id }.merge(data))
      end

      def create(project_id, params)
        data = client.post("/projects/#{project_id}/stories", params: params).body

        Resources::Story.new({ }.merge(data))
      end

      def update(project_id, id, params)
        data = client.put("/projects/#{project_id}/stories/#{id}", params: params).body

        Resources::Story.new({ }.merge(data))
      end

      def delete(project_id, id)
        client.delete("/projects/#{project_id}/stories/#{id}").body
      end

      def tasks
        Endpoints::Tasks.new(client)
      end

      def comments
        Endpoints::Comments.new(client)
      end

      def labels
        Endpoints::Labels.new(client)
      end
    end
  end
end
