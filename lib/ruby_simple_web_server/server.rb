require "socket"

module RubySimpleWebServer
  class Server
    def run
      begin
        socket = Socket.new(:INET, :STREAM)
        socket.bind(Addrinfo.tcp('0.0.0.0', 3000))
        socket.listen(8)

        puts "Use Ctrl-C to stop"
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