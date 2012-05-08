module JrJackson
  module Deserializers
    class Symbolize < Rubyify
      def convertKey(key)
        key.to_sym
      end
    end
  end
end