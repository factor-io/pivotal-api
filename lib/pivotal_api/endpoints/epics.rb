module PivotalApi
  module Endpoints
    class Epics
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def all(project_id, params={})
        data = client.paginate("/projects/#{project_id}/epics", params: params)
        raise PivotalApi::Errors::UnexpectedData, 'Array of epics expected' unless data.is_a? Array

        data.map do |epic|
          Resources::Epic.new({ project_id: project_id }.merge(epic))
        end
      end

      def get(project_id, id)
        data = client.get("/projects/#{project_id}/epics/#{id}").body

        Resources::Epic.new({ project_id: project_id }.merge(data))
      end
    end
  end
end
