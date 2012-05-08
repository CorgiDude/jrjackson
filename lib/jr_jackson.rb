require 'java'

require 'vendor/jackson-core-asl-1.9.5'
require 'vendor/jackson-mapper-asl-1.9.5'
require 'vendor/jackson-smile-1.9.5'

require 'jr_jackson/json'
require 'jr_jackson/smile'

module JrJackson
  def self.json
    @json ||= Json.new
  end

  def self.smile
    @smile ||= Smile.new
  end
end
