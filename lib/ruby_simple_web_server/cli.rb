
module RubySimpleWebServer
  class CLI
    attr_accessor :launcher

    def initialize(argv)
      @argv = argv.dup

      @launcher = RubySimpleWebServer::Launcher.new
    end

    def run
      @launcher.run
    end
  end
end