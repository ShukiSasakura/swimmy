module Swimmy
  module Resource
    class Openhabresource
      
      def initialize(value, state)
        @value = value 
        @state = state
      end

      def get_value
        return @value
      end

      def get_state
        return @state
      end
    end
  end
end
