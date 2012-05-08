module JrJackson
  module Deserializers
    java_import 'org.codehaus.jackson.map.deser.UntypedObjectDeserializer'
    java_import 'org.codehaus.jackson.JsonToken'

    class Rubyify < UntypedObjectDeserializer
      def mapArray(jp, ctxt)
        arr = super(jp, ctxt)
        arr.entries
      end

      def mapObject(jp, ctxt)
        t = jp.current_token
        t = jp.next_token if t == JsonToken::START_OBJECT

        return {} if t != JsonToken::FIELD_NAME

        tmp = []
        begin
          k = jp.text
          jp.next_token
          v = deserialize(jp, ctxt)
          tmp.push(convertKey(k))
          tmp.push(v)
        end while jp.next_token != JsonToken::END_OBJECT

        Hash[*tmp]
      end

      def convertKey(key)
        key
      end
    end
  end
end

