path = File.expand_path "../", __FILE__
APP_PATH = path

require "#{APP_PATH}/config/env"

class Fcanessa < Sinatra::Base

  configure :development do # use thin start
    set :public, "public"
    set :static, true
  end

  enable :sessions
  set :method_override, true

  def not_found(object=nil)
    halt 404, "404 - Page Not Found"
  end


  get "/" do
    haml :index
  end

  get "/*" do
    not_found
  end
end