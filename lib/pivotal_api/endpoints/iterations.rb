module PivotalApi
  module Endpoints
    class Iterations
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def all(project_id, params={})
        data = client.paginate("/projects/#{project_id}/iterations", params: params)
        raise PivotalApi::Errors::UnexpectedData, 'Array of iterations expected' unless data.is_a? Array

        data.map do |iteration|
          Resources::Iteration.new({ project_id: project_id }.merge(iteration))
        end
      end
    end
  end
end