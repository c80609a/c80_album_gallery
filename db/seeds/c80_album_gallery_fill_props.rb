# rake db:seed:c80_album_gallery_fill_props

C80AlbumGallery::Prop.delete_all
C80AlbumGallery::Prop.create!({
                                  thumb_lg_width: 640,
                                  thumb_lg_height: 400,

                                  thumb_md_width: 320,
                                  thumb_md_height: 200,

                                  thumb_sm_width: 80,
                                  thumb_sm_height: 50,

                                  thumb_preview_width: 250,
                                  thumb_preview_height: 164

                              })

=begin
p = C80AlbumGallery::Prop.first
p.thumb_preview_width = 250
p.thumb_preview_height = 164
p.save!
=end
