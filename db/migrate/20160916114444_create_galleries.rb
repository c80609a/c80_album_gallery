class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :c80_album_gallery_galleries, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :title
      t.string :tag

      t.timestamps
    end
  end
end
