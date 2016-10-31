class MySinatraApp < Sinatra::Base
  get "/" do
    "Hello from sinatra"
  end
end

class SinatraMiddleware
  def initialize(app)
    @rails_app = app
  end

  def call(env)
    if env["PATH_INFO"] =~ %r{^/sinatra}  # /^\/sinatra/
      env["PATH_INFO"].sub! %r{^/sinatra}, ""  # /hi_whatever
      MySinatraApp.call(env)
    else
      @rails_app.call(env)
    end
  end
end