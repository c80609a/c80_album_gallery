require 'carrierwave/processing/mini_magick'

module C80AlbumGallery

  class GphotoUploader < BaseFileUploader

    include CarrierWave::MiniMagick

    def store_dir
      "uploads/gallery/#{format("%03d",model.gallery_id)}"
    end

    # ограничение оригинальной картинки
    process :resize_to_limit => [1600,1600]

    version :thumb_lg do
      process :resize_to_lg
    end

    version :thumb_lg_gray do
      process :resize_to_lg => 'gray'
    end

    version :thumb_md do
      process :resize_to_md
    end

    version :thumb_md_gray do
      process :resize_to_md => 'gray'
    end

    version :thumb_sm do
      process :resize_to_sm
    end

    version :thumb_sm_gray do
      process :resize_to_sm => 'gray'
    end
    
    version :thumb_preview do
      process :resize_to_preview
    end

    version :thumb_preview_gray do
      process :resize_to_preview => 'gray'
    end

# ------------------------------------------------------------------------------------------------------------------------

    def resize_to_lg(type='normal')

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_lg_width
        h = C80AlbumGallery::Prop.first.thumb_lg_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"

        if type == 'gray'
          img = img.colorspace 'Gray'
        end

        img = yield(img) if block_given?
        img

      end
  
    end

    def resize_to_md(type='normal')

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_md_width
        h = C80AlbumGallery::Prop.first.thumb_md_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"

        if type == 'gray'
          img = img.colorspace 'gray'
        end

        img = yield(img) if block_given?
        img

      end

    end

    def resize_to_sm(type='normal')

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_sm_width
        h = C80AlbumGallery::Prop.first.thumb_sm_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"

        if type == 'gray'
          img = img.colorspace 'gray'
        end

        img = yield(img) if block_given?
        img

      end

    end

    def resize_to_preview(type='normal')

      manipulate! do |img|

        w = C80AlbumGallery::Prop.first.thumb_preview_width
        h = C80AlbumGallery::Prop.first.thumb_preview_height

        img.resize "#{w}x#{h}^"
        img.gravity 'center'
        img.extent "#{w}x#{h}"

        if type == 'gray'
          img = img.colorspace 'gray'
        end

        img = yield(img) if block_given?
        img

      end

    end

  end

end