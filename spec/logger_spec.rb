require "spec_helper"

RSpec.describe RubySimpleWebServer::Logger do
  describe "Logger" do
    let(:output) { double("output") }

    it "logger" do
      logger = RubySimpleWebServer::Logger.new(output)
      expect(output).to receive(:puts).with("some notice")
      logger.log("some notice")
    end
  end

end