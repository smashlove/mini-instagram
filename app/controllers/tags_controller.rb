class TagsController < ApplicationController

  get '/tags' do
    @tags = Tag.all.sort_by {|tag| tag.name}
    erb :'tags/index'
  end

  get '/tags/:id' do
    @tag = Tag.find(params[:id])
    @pictures = @tag.pictures
    erb :'tags/show'
  end
end
