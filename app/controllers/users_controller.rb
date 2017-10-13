class UsersController < ApplicationController

  get '/users' do
    @users = User.all.sort_by {|user| user.username}
    erb :'users/index'
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @pictures = @user.pictures
    erb :'users/show'
  end
end
