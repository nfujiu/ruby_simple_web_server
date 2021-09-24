module RubySimpleWebServer
  class Runner

    def run
      @server = server = start_server
      server_thread = server.run
      # server_thread.join
    end

    private

    def start_server


      p application

      server = RubySimpleWebServer::Server.new(app)
      server
    end


    private

    def app
      Rack::Builder.new do
        run lambda { |env| [200, {"Content-Type" => "text/plain"}, ["Hello World"]] }
      end
    end
  end
end