module RubySimpleWebServer
  class Runner

    def run
      @server = server = start_server
      server_thread = server.run
      # server_thread.join
    end

    private

    def start_server
      server = RubySimpleWebServer::Server.new
      server
    end
  end
end