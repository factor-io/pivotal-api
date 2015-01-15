module PivotalApi
  module Endpoints
    class Projects
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      # @param [Hash] params
      # @return [Array[PivotalApi::Resources::Project]]
      def all(params={})
        data = client.paginate('/projects', params: params)
        raise PivotalApi::Errors::UnexpectedData, 'Array of projects expected' unless data.is_a? Array

        data.map { |project| Resources::Project.new({ }.merge(project)) }
      end


      # @param [Hash] params
      # @return [PivotalApi::Resources::Project]
      def get(id, params={})
        # Endpoints::Project.new(self).get(id, params)
        data = client.get("/projects/#{id}", params: params).body

        Resources::Project.new({ }.merge(data))
      end

      def epics
        Endpoints::Epics.new(client)
      end

      def iterations
        Endpoints::Iterations.new(client)
      end

      def stories
        Endpoints::Stories.new(client)
      end

      def memberships
        Endpoints::Memberships.new(client)
      end

      def webhooks
        Endpoints::Webhooks.new(client)
      end
    end
  end
end
