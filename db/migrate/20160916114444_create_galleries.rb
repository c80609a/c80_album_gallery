class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :c80_album_gallery_galleries do |t|
      t.string :title
      t.string :tag

      t.timestamps
    end
  end
end
