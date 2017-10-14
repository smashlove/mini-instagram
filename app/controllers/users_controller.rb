class UsersController < ApplicationController

  get '/users' do
    @users = User.all.sort_by {|user| user.username}
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    new_user = User.create(params)
    new_user.save
    redirect "/users/#{new_user.id}"
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    @pictures = @user.pictures
    erb :'users/show'
  end

  get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :'users/edit'
  end

  patch '/users/:id' do
    @user = User.find(params[:id])
    @user.update_attributes(params["user"])
    redirect "/users/#{@user.id}"
  end

  get '/users/:id/delete' do
    @user = User.find(params[:id])
  end

  delete '/users/:id/delete' do
    @user = User.find(params[:id])
    @user.delete
    redirect "/users"
  end
end
