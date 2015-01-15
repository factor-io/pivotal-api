module PivotalApi
  module Endpoints
    class Tasks
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def all(project_id, story_id,  params={})
        data = client.paginate("/projects/#{project_id}/stories/#{story_id}/tasks", params: params)
        raise PivotalApi::Errors::UnexpectedData, 'Array of tasks expected' unless data.is_a? Array

        data.map do |task|
          Resources::Task.new({project_id: project_id }.merge(task))
        end
      end

      def get(project_id, story_id, id)
        data = client.get("/projects/#{project_id}/stories/#{story_id}/tasks/#{id}").body

        Resources::Task.new({project_id: project_id }.merge(data))
      end
    end
  end
end
