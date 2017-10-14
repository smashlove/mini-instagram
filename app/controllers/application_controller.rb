class ApplicationController < Sinatra::Base
  # register Sinatra::ActiveRecordExtension
  # enable :sessions
  # set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    @users = User.all
    @tags = Tag.all.sort_by {|tag| tag.name}
    erb :index
  end
end
