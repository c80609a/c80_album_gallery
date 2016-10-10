class CreateGphotos < ActiveRecord::Migration
  def change
    create_table :c80_album_gallery_gphotos, :options => 'COLLATE=utf8_unicode_ci' do |t|
      t.string :image
      t.references :gallery, index: true

      t.timestamps
    end
  end
end
