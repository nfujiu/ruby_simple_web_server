require "socket"
require "ruby_simple_web_server/request"

module RubySimpleWebServer
  class Server

    def initialize(app)
      @app = app
    end

    def run
      begin
        socket = Socket.new(:INET, :STREAM)
        socket.bind(Addrinfo.tcp('0.0.0.0', 3000))
        socket.listen(4)

        RubySimpleWebServer.logger.log "Use Ctrl-C to stop"
        loop do
          listening, = IO.select([socket])
          io, = listening
          connection, addrinfo = io.accept
          echo = connection.gets
          connection.puts echo
          connection.close
        end
      ensure
        socket.close
      end
    end
  end
end