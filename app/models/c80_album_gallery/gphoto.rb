module C80AlbumGallery
  class Gphoto < ActiveRecord::Base
    belongs_to :gallery
    mount_uploader :image, GphotoUploader
  end
end