# frozen_string_literal: true

require "rack"
require "socket"
require "uri"
require "time"
require "stringio"

require_relative "ruby_simple_web_server/version"
require_relative "ruby_simple_web_server/logger"
require_relative "ruby_simple_web_server/cli"
require_relative "ruby_simple_web_server/launcher"
require_relative "ruby_simple_web_server/runner"
require_relative "ruby_simple_web_server/server"
require_relative "ruby_simple_web_server/binder"
require_relative "ruby_simple_web_server/const"

module RubySimpleWebServer
  def self.logger
    @logger ||= RubySimpleWebServer::Logger.new
  end
end
