require "sinatra/base"

class App < Sinatra::Base
  get "/" do
    "ok"
  end
end
