class User < ActiveRecord::Base
  has_many :pictures
  has_many :picture_tags, through: :pictures
  has_many :tags, through: :picture_tags
end
