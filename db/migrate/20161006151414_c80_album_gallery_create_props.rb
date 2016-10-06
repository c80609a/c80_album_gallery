class C80AlbumGalleryCreateProps < ActiveRecord::Migration
  def change
    create_table :c80_album_gallery_props, :options => 'COLLATE=utf8_unicode_ci' do |t|

      t.integer :thumb_lg_width
      t.integer :thumb_lg_height

      t.integer :thumb_md_width
      t.integer :thumb_md_height

      t.integer :thumb_sm_width
      t.integer :thumb_sm_height

      t.timestamps null: false
    end
  end
end
