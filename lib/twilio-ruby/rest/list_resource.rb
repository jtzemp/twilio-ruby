module Twilio
  module REST
    class ListResource
      include Utils

      def initialize(uri, client)
        @resource_name = self.class.name.split('::')[-1]
        @instance_class = Twilio::REST.const_get @resource_name.chop
        @uri, @client = uri, client
      end
    
      # Grab a list of this kind of resource and return it as an array. The
      # array includes a special property called +total+ which will return the
      # total number of items in the list on Twilio's server.
      def list(params = {})
        raise "Can't get a resource list without a REST Client" unless @client
        response = @client.get @uri, params
        resources = response[detwilify(@resource_name)]
        resource_list = resources.map do |resource|
          @instance_class.new "#{@uri}/#{resource['sid']}", @client, resource
        end
        # set the +total+ property on the array
        resource_list.instance_eval {
          eigenclass = class << self; self; end
          eigenclass.send :define_method, :total, &lambda {response['total']}
        }
        # update the list's internal total if we just fetched the whole list
        @total = response['total'] if params.empty?
        resource_list
      end

      # Ask Twilio for the total number of items in the list and cache it.
      def total!
        raise "Can't get a resource total without a REST Client" unless @client
        response = @client.get @uri, :page_size => 1
        @total = response['total']
      end

      # Return the cached total number of items in the list, or fetch and cache.
      def total
        @total ||= total!
      end

      # Return an empty instance resource object with the proper URI.
      def get(sid)
        @instance_class.new "#{@uri}/#{sid}", @client
      end
    
      # Return a newly created resource.
      def create(params = {})
        raise "Can't create a resource without a REST Client" unless @client
        response = @client.post @uri, params
        @instance_class.new "#{@uri}/#{response['sid']}", @client, response
      end
    end
  end
end
