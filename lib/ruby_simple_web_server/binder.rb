require "ruby_simple_web_server/configuration"

module RubySimpleWebServer
  class Binder
    def initialize(conf = Configuration.new)

      @proto_env = {
        "rack.version".freeze => [1.6],
        "rack.errors".freeze => STDERR,
      }
    end
  end
end