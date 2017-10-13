class Picture < ActiveRecord::Base
  belongs_to :user
  has_many :picture_tags
  has_many :tags, through: :picture_tags

end
