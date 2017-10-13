class TagsController < ApplicationController

  get '/tags' do
    @tags = Tag.all.sort_by {|tag| tag.name}
    erb :'tags/index'
  end
end
