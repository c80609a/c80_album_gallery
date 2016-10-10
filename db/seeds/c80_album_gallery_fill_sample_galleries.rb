# rake db:seed:c80_album_gallery_fill_sample_galleries

C80AlbumGallery::Gallery.delete_all
C80AlbumGallery::Gallery.create!([
                                     {
                                         id: 1,
                                         title: 'Люди'
                                     },
                                     {
                                         id: 2,
                                         title: 'Осень'
                                     },
                                     {
                                         id: 3,
                                         title: 'Натюрморт'
                                     }
                                 ])