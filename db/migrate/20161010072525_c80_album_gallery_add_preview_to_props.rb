class C80AlbumGalleryAddPreviewToProps < ActiveRecord::Migration
  def change
    add_column :c80_album_gallery_props, :thumb_preview_width, :integer
    add_column :c80_album_gallery_props, :thumb_preview_height, :integer
  end
end
