module Swimmy
  module Service
    class Openhabinfo
      require "json"
      require "uri"
      require "open-uri"

      def initialize()
        #@openhab_uri = openhab_uri
        @openhab_uri = ENV["OPENHAB_API_KEY"]
        @opinfo = JSON.parse(URI.open(@openhab_uri, &:read)) 
      end

      def fetch_info
        info = {}
        retval = []
        puts '+++++++++++++++++++++++'
        puts @openhab_uri
        puts '---------------------------'
        @opinfo.each do |openhab_data|
          next if openhab_data["metadata"] == nil
          retval.push(Swimmy::Resource::Openhabresource.new(openhab_data["metadata"]["swimmy"]["value"], openhab_data["state"]))
          #if openhab_data["metadata"]["swimmy"]["value"] == keyword
            #info = openhab_data["state"]
          #info[:value] = openhab_data["metadata"]["swimmy"]["value"]
          #info[:state] = openhab_data["state"]
          #end
        end
        #return info
        return retval
      end

      def fetch_help
        help = ""
        @opinfo.each do |openhab_data|
          next if openhab_data["metadata"] == nil
          if openhab_data["metadata"]["swimmy"]
            help += openhab_data["metadata"]["swimmy"]["value"]
            help += "："
            help += openhab_data["metadata"]["swimmy"]["config"]["description"]
            help += "\n"    
          end
        end
        return help
      end

        #info[:result] = JSON.parse(URI.open(@openhab_uri, &:read))["state"]

    end # class Openhabinfo
  end # module Service
end # module Swimmy
