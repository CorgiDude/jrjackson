module JrJackson
  java_import 'org.codehaus.jackson.smile.SmileFactory'

  class Smile < Json
    def mapper
      @mapper ||= ObjectMapper.new(SmileFactory.new)
    end

    def load(smile_bytes)
      mapper.read_value(smile_bytes, 0, smile_bytes.size, Jclass)
    end
    alias_method :parse, :load

    def dump(object)
      mapper.write_value_as_bytes(object)
    end
    alias_method :generate, :dump
  end
end