module Swimmy
  module Service
    class Openhab
      require "json"
      require "uri"
      require "open-uri"

      def initialize(openhab_url, metadataname)
        @openhab_uri = openhab_url + "/rest/items?metadata=" + metadataname
        @metadataname = metadataname 
      end

      def fetch_info
        retval = []
        opinfo = JSON.parse(URI.open(@openhab_uri, &:read)) 
        opinfo.each do |openhab_data|
          next if openhab_data["metadata"] == nil
          retval.push(Swimmy::Resource::Openhabresource.new(@metadataname, 
                                                            openhab_data["metadata"][@metadataname]["value"],
                                                            openhab_data["state"],
                                                            openhab_data["metadata"][@metadataname]["config"]))
        end
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


    end # class Openhabinfo
  end # module Service
end # module Swimmy
