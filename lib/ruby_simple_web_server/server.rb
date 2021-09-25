require "socket"
require "ruby_simple_web_server/request"

module RubySimpleWebServer
  class Server
    include RubySimpleWebServer::Request

    def initialize(app, sock)
      @app = app
      @sock = sock
    end

    def run
      RubySimpleWebServer.logger.log "Use Ctrl-C to stop"

      loop do
        handle(@app, @sock)
      rescue Interrupt
        RubySimpleWebServer.logger.log("interrupted")
        return
      end
    end
  end
end