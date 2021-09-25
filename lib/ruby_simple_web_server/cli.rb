
module RubySimpleWebServer
  class CLI
    attr_accessor :launcher

    def initialize(argv)
      @argv = @conf = argv.dup
      @launcher = RubySimpleWebServer::Launcher.new(@conf)
    end

    def run
      @launcher.run
    end
  end
end