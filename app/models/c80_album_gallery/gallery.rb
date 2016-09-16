module C80AlbumGallery
  class Gallery < ActiveRecord::Base
    has_many :gphotos, :dependent => :destroy
    accepts_nested_attributes_for :gphotos,
                                  :reject_if => lambda { |attributes|
                                    !attributes.present?
                                  },
                                  :allow_destroy => true
  end

end