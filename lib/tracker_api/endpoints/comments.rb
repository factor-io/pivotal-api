module TrackerApi
  module Endpoints
    class Comments
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def all(project_id, story_id, params={})
        data = client.paginate("/projects/#{project_id}/stories/#{story_id}/comments", params: params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of stories expected' unless data.is_a? Array

        data.map do |story|
          Resources::Comment.new({ project_id: project_id }.merge(story))
        end
      end

      def get(project_id, story_id, id)
        data = client.get("/projects/#{project_id}/stories/#{story_id}/comments/#{id}").body

        Resources::Comment.new({ project_id: project_id }.merge(data))
      end

      def create(project_id, story_id, params)
        data = client.post("/projects/#{project_id}/stories/#{story_id}/comments", params: params).body

        Resources::Comment.new({ project_id: project_id }.merge(data))
      end

      def update(project_id, story_id, id, params)
        data = client.put("/projects/#{project_id}/stories/#{story_id}/comments/#{id}", params: params).body

        Resources::Comment.new({ }.merge(data))
      end

      def delete(project_id, story_id, id)
        client.delete("/projects/#{project_id}/stories/#{story_id}/comments/#{id}").body
      end
    end
  end
end
