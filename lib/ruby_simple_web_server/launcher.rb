module RubySimpleWebServer
  class Launcher

    def initialize(conf)
      @config = conf
      @runner = RubySimpleWebServer::Runner.new(@config)
    end

    def run
      @runner.run
    end
  end
end