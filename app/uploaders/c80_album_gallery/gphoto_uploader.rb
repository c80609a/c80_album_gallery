module C80AlbumGallery

  class GphotoUploader < BaseFileUploader

    def store_dir
      "uploads/gallery/#{format("%03d",model.gallery_id)}"
    end

    # ограничение оригинальной картинки
    process :resize_to_limit => [1024,768]

    version :thumb512 do
      process :resize_to_fill => [512,384]
    end

    version :thumb256 do
      process :resize_to_fill => [256,192]
    end

    version :thumb320 do
      process :resize_to_fill => [320,200]
    end

    version :thumb640 do
      process :resize_to_fill => [640,400]
    end

  end

end