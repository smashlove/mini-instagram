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
    @pictures = @user.pictures
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

  get '/users/:id/new-photo' do
    @user = User.find(params[:id])
    erb :'users/new-photo'
  end

  delete '/users/:id/:photo_id/delete' do
    @user = User.find(params[:id])
    @photo = Picture.find(params[:photo_id])
    @photo.delete
    redirect "/users/#{@user.id}/edit"
  end

  post '/users/:id' do
    @user = User.find(params[:id])
    new_photo = Picture.create(:image_link => params["image_link"], :user_id => @user.id)
    new_photo.save
    new_tags = params[:tags]
    new_tags.split(", ").each do |tag|
      new_tag = Tag.find_or_create_by(:name => tag)
      new_photo.tags << new_tag
    end
    redirect "/users/#{@user.id}"
  end
end
