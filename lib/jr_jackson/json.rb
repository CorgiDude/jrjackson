require 'jr_jackson/deserializers/rubyify'
require 'jr_jackson/deserializers/symbolize'

module JrJackson
  java_import 'org.codehaus.jackson.map.ObjectMapper'
  java_import 'org.codehaus.jackson.map.JsonDeserializer'
  java_import 'org.codehaus.jackson.map.module.SimpleModule'
  java_import 'org.codehaus.jackson.Version'

  class Json
    Jclass = java.lang.Object.java_class

    def initialize(deserializer = nil)
      add_deserializer(deserializer) if deserializer
    end

    def mapper
      @mapper ||= ObjectMapper.new
    end

    def load(json)
      mapper.read_value(json, Jclass)
    end
    alias_method :parse, :load

    def dump(object)
      mapper.write_value_as_string(object)
    end
    alias_method :generate, :dump

    private

    def add_deserializer(deserializer)
      deserializer_class = parse_deserializer(deserializer)

      simple_wrapper = SimpleModule.new("JrJacksonModule", Version.new(1, 0, 0, nil))
      simple_wrapper.add_deserializer(Jclass, deserializer_class.new)

      mapper.register_module(simple_wrapper)
    end

    def parse_deserializer(deserializer)
      case deserializer
      when JsonDeserializer
        deserializer
      when Symbol, String
        deserializer = deserializer.to_s.capitalize
        Deserializers.const_get(deserializer)
      else
        raise ArgumentError, "deserializer type (#{deserializer.class}) not recognized"
      end
    end
  end
end