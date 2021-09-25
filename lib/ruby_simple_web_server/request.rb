module RubySimpleWebServer
  module Request
    def handle(app, sock)
      begin
        listening, = IO.select([sock])
        io, = listening
        socket, = io.accept
        process(app, socket)
      ensure
        socket&.close
      end
    end

    private

    def process(app, sock)
      _env = env(sock)
      status, headers, body = app.call(_env)

      sock.write "HTTP/1.1 #{status} #{Rack::Utils::HTTP_STATUS_CODES.fetch(status) { 'UNKNOWN' }}\r\n"
      sock.write "Date: #{Time.now.httpdate}\r\n"
      sock.write "Connection: close\r\n"
      headers.each { |key, value| sock.write "#{key}: #{value}\r\n" }
      sock.write "\r\n"
      body.each { |chunk| sock.write(chunk) }

      RubySimpleWebServer.logger.log "finish request"
    end

    def env(sock)
      binder = RubySimpleWebServer::Binder.new(sock)

      binder.env
    end
  end
end