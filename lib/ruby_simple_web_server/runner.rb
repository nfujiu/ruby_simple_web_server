require "rack"

module RubySimpleWebServer
  class Runner

    def run
      @server = server = start_server
      server_thread = server.run
      # server_thread.join
    end

    private

    def start_server
      sock = Socket.new(:INET, :STREAM)
      sock.bind(Addrinfo.tcp('0.0.0.0', 3000))
      sock.listen(4)

      server = RubySimpleWebServer::Server.new(mock_app, sock)
      server
    end

    private
    def mock_app
      Rack::Builder.new do
        run lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Hello World"]] }
      end
    end
  end
end