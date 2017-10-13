module PixabayImages

class Adapter

  def fetch_images
    images = JSON.parse(RestClient.get("https://pixabay.com/api/?key=#{ENV['PIXABAY_API_KEY']}&image_type=photo&category=people&safesearch=true&per_page=100&pretty=true"))

    images["hits"].each do |image_hash|
      # binding.pry
      new_picture = Picture.create(:image_link => image_hash["previewURL"])
      new_picture.user_id = User.order("RANDOM()").first.id
      new_picture.save
      tags = image_hash["tags"].split(", ").collect {|tag| tag}
      new_tags = create_tag(tags, new_picture.id)
      new_picture.tags << new_tags
    end
  end

  def create_tag(arg, image_id)
    arg.collect do |tag|
      new_tag = Tag.find_or_create_by(:name => tag)
    end
  end

end

end
