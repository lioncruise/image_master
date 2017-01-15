class Picture < ActiveRecord::Base

  has_and_belongs_to_many :tags
  belongs_to :user

  mount_uploader :url, PictureUploader
end
