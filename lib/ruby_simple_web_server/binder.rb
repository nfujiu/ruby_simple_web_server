require_relative "const"

module RubySimpleWebServer
  class Binder
    include RubySimpleWebServer::Const
    RACK_VERSION = [1,6].freeze

    def initialize(sock)
      matches = /\A(?<REQUEST_METHOD>\S+)\s+(?<REQUEST_URI>\S+)\s+(?<HTTP_VERSION>\S+)\r\n\Z/.match(sock.gets)
      uri = URI.parse(matches[:REQUEST_URI])

      @proto_env = {
        "rack.version".freeze => RACK_VERSION,
        "rack.errors".freeze => $stderr,
        "rack.url_scheme" => uri.scheme,
        "rack.input" => StringIO.new(sock.read(0)),
        "REQUEST_METHOD" => matches[:REQUEST_METHOD],
        "REQUEST_URI" => matches[:REQUEST_URI],
        "HTTP_VERSION" => matches[:HTTP_VERSION],
        "QUERY_STRING" => uri.query,
        "SERVER_PORT" => uri.port,
        "SERVER_NAME" => uri.host,
        "PATH_INFO" => uri.path,
        "SCRIPT_NAME" => "",
        "CONTENT_TYPE" => "text/plain",
        "CONTENT_LENGTH" => "0",
      }

      while matches = /\A(?<key>[^:]+):\s*(?<value>.+)\r\n\Z/.match(hl = sock.gets)
        case matches[:key]
        when Rack::CONTENT_TYPE then @proto_env["CONTENT_TYPE"] = matches[:value]
        when Rack::CONTENT_LENGTH then @proto_env["CONTENT_LENGTH"] = Integer(matches[:value])
        else @proto_env["HTTP_" + matches[:key].tr("-", "_").upcase] ||= matches[:value]
        end
      end
    end

    def env
      @proto_env
    end
  end
end