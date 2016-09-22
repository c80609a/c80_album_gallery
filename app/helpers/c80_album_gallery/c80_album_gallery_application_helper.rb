module C80AlbumGallery
  module C80AlbumGalleryApplicationHelper

    # TODO:: негибко: а что делать, если мне нужен иной путь в host приложеии, не portfolio?
    def my_url_for_gallery(gallery)
      "#{root_url}portfolio/#{gallery.id}"
    end

    def render_gallery_list

      v = Gallery.all

      render :partial => 'c80_album_gallery/flow_galleries',
             :locals => {
                 list:v
             }

    end

    def render_view_gallery_page(gallery,perrow=3)

      render :partial => 'c80_album_gallery/gallery',
             :locals => {
                 :gallery => gallery,
                 :perrow => perrow,
                 :gtag => gallery.id
             }

    end

  end
end