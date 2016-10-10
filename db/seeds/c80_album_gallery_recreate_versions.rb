# rake db:seed:c80_album_gallery_recreate_versions

C80AlbumGallery::Gallery.all.each do |gallery|
  gallery.gphotos.each do |gphoto|
    gphoto.image.recreate_versions!
  end
end