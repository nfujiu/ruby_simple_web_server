# frozen_string_literal: true

require_relative "ruby_simple_web_server/version"
require_relative "ruby_simple_web_server/logger"
require_relative "ruby_simple_web_server/cli"
require_relative "ruby_simple_web_server/launcher"

module RubySimpleWebServer
  def self.logger
    @logger ||= RubySimpleWebServer::Logger.new
  end
end
