module RubySimpleWebServer
  class Logger
    def initialize(logger = STDOUT)
      @logger = logger
    end

    def log(message)
      @logger.puts message
    end
  end
end