module C80AlbumGallery

  class GphotoUploader < BaseFileUploader

    def store_dir
      "uploads/gallery/#{format("%03d",model.gallery_id)}"
    end

    # ограничение оригинальной картинки
    process :resize_to_limit => [1600,1600]

    version :thumb_lg do
      process :resize_to_lg
    end

    version :thumb_md do
      process :resize_to_md
    end

    version :thumb_sm do
      process :resize_to_sm
    end
    
    version :thumb_preview do
      process :resize_to_preview
    end

# ------------------------------------------------------------------------------------------------------------------------

    def resize_to_lg

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_lg_width
        h = C80AlbumGallery::Prop.first.thumb_lg_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"
        img = yield(img) if block_given?
        img

      end
  
    end

    def resize_to_md

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_md_width
        h = C80AlbumGallery::Prop.first.thumb_md_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"
        img = yield(img) if block_given?
        img

      end

    end

    def resize_to_sm

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_sm_width
        h = C80AlbumGallery::Prop.first.thumb_sm_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"
        img = yield(img) if block_given?
        img

      end

    end

    def resize_to_preview

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_preview_width
        h = C80AlbumGallery::Prop.first.thumb_preview_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"
        img = yield(img) if block_given?
        img

      end

    end

  end

end