ActiveAdmin.register C80AlbumGallery::Gallery, :as => 'Gallery' do

  menu :label => "Галереи"

  permit_params :title,
                :tag,
                :gphotos_attributes => [:id,:image,:_destroy]

  before_filter :skip_sidebar!, :only => :index

  # controller do
  #   cache_sweeper :suit_sweeper, :only => [:update,:create,:destroy]
  # end

  index do
    selectable_column
    id_column
    column :tag
    column "Дата" do |gallery|
      "#{local_time(gallery[:created_at],format: '%e/%m/%Y')}".html_safe
    end
    column "Заголовок" do |gallery|
      "<h3 style='width:150px;'>#{gallery.title}</h3>".html_safe
    end

    column "" do |gallery|
      arr = []
      gallery.gphotos.limit(2).each do |gp|
        arr << image_tag(gp.image.thumb256, :style => "margin-left:5px")
      end
      arr << "<br>Всего фотографий: #{gallery.gphotos.count}"
      arr.join("").html_safe
    end

    actions
  end

  form(:html => {:multipart => true}) do |f|
    f.inputs "Галерея" do
      f.input :title
      f.input :tag

      f.inputs "Фотографии" do
        f.has_many :gphotos, :allow_destroy => true do |gp|
          gp.input :image,
                   :as => :file,
                   :hint => gp.template.image_tag(gp.object.image.thumb256)
        end
      end

    end
    f.actions
  end

end