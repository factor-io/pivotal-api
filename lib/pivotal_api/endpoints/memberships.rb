module PivotalApi
  module Endpoints
    class Memberships
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def all(project_id, params={})
        data = client.paginate("/projects/#{project_id}/memberships", params: params)
        raise PivotalApi::Errors::UnexpectedData, 'Array of memberships expected' unless data.is_a? Array

        data.map do |membership|
          Resources::ProjectMembership.new({ project_id: project_id }.merge(membership))
        end
      end

      def get(project_id, id)
        data = client.get("/projects/#{project_id}/memberships/#{id}").body

        Resources::ProjectMembership.new({ project_id: project_id }.merge(data))
      end
    end
  end
end
