module C80AlbumGallery
  module C80AlbumGalleryApplicationHelper

    def render_gallery_list

      v = Gallery.all

      render :partial => "site/shared/flow/flow_galleries",
             :locals => {
                 list:v
             }

    end

  end
end