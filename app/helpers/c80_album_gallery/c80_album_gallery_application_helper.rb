module C80AlbumGallery
  module C80AlbumGalleryApplicationHelper

    # TODO:: негибко: а что делать, если мне нужен иной путь в host приложеии, не portfolio?
    def my_url_for_gallery(gallery)
      "#{root_url}portfolio/#{gallery.id}"
    end

    # выдать список обложек галерей, снабжённых title, при клике ведущих на просмотр галери
    def render_gallery_list_old

      v = Gallery.all

      render :partial => 'c80_album_gallery/flow_galleries',
             :locals => {
                 list:v
             }

    end

    # отрендерить "внутренности" галереи: т.е. открыть на просмотр фото
    def render_view_gallery_page_old(gallery,perrow=3)

      render :partial => 'c80_album_gallery/gallery',
             :locals => {
                 :gallery => gallery,
                 :perrow => perrow,
                 :gtag => gallery.id
             }

    end

    def render_view_gallery_page(gallery,
                                 css_list_klass='style_1',
                                 css_item_klass='col-lg-4 col-md-4 col-sm-6 col-xs-6',
                                 thumb_size='thumb_md')

      list = gallery.gphotos

      w = C80AlbumGallery::Prop.first.send("#{thumb_size}_width")
      h = C80AlbumGallery::Prop.first.send("#{thumb_size}_height")
      w_style = "width:#{w}px"
      h_style = "height:#{h}px"
      # wh_style = "#{w_style};#{h_style}"

      render :partial => 'c80_album_gallery/gallery_view_page',
             :locals => {
                 list: list,
                 css_list_klass: css_list_klass,
                 css_item_klass: css_item_klass,
                 thumb_size: thumb_size,
                 w_style: w_style,
                 h_style: h_style,
                 gallery_title: gallery.title
             }

    end

    # выдать список обложек галерей, снабжённых title, при клике ведущих на просмотр галери
    #   1. Под список фиксируется count позиций: если галереи для какой-то позиции не нашлось - будет выведена серая болванка (которая будет как бы намекать "дружок, тут должно быть что-то согласно макету, загрузи недостающие элементы")
    #   2. Галереи берутся в порядке def_order, затем случайным образом перемешиваются, затем уже вставляются во VIEW.
    #   3. С помощью css_klass можно регулировать количество элементов в ряду.
    #   4. С помощью css_list_klass можно кастомизировать внеший вид списка.
    #   5. С помощью thumb_size можно регулировать размер картинки
    def render_gallery_list_slots(count=nil,
                                  css_list_klass=nil,
                                  css_item_klass=nil,
                                  thumb_size=nil,
                                  section_title=nil)

      count = count.present? ? count : 3
      css_list_klass = css_list_klass.present? ? css_list_klass : ''
      css_item_klass = css_item_klass.present? ? css_item_klass : 'col-lg-4 col-md-4 col-sm-6 col-xs-6'
      thumb_size = thumb_size.present? ? thumb_size : 'thumb_md'

      # извлечём нужное количество альбомов (нужно помнить, что нужного количества может и не набраться)
      galleries = Gallery.all.def_order.limit(count).order('rand()')

      # предварительно подготовим список к рендеру
      list = []
      count.times do |i|
        gallery = galleries[i]
        if gallery.present?
          list << gallery
        else
          list << Gallery.new({ title: "Слот #{i}", tag: "slot_#{i}" })
        end
      end

      render :partial => 'c80_album_gallery/flow_galleries_slots',
             :locals => {
                 list: list,
                 count: count,
                 css_list_klass: css_list_klass,
                 css_item_klass: css_item_klass,
                 thumb_size: thumb_size,
                 section_title: section_title
             }

    end

    # выдать список обложек галерей, снабжённых title, при клике ведущих на просмотр галереи
    #   2. Галереи берутся в порядке def_order
    #   3. С помощью css_klass можно регулировать количество элементов в ряду.
    #   4. С помощью css_list_klass можно кастомизировать внеший вид списка.
    #   5. С помощью thumb_size можно регулировать размер картинки
    #   6. С помощью is_grayscaled можно получить список из чб картинок.
    def render_gallery_list(      css_list_klass='style_1',
                                  css_item_klass='col-lg-4 col-md-4 col-sm-6 col-xs-6',
                                  thumb_size='thumb_md',
                                  is_grayscaled=false,
                                  section_title=nil)

      partial_name = 'c80_album_gallery/gallery_list'
      if is_grayscaled
        partial_name = 'c80_album_gallery/gallery_list_grayscaled'
      end

      galleries_list = Gallery.all.def_order

      w = C80AlbumGallery::Prop.first.send("#{thumb_size}_width")
      h = C80AlbumGallery::Prop.first.send("#{thumb_size}_height")
      w_style = "width:#{w}px"
      h_style = "height:#{h}px"
      # wh_style = "#{w_style};#{h_style}"

      render :partial => partial_name,
             :locals => {
                 list: galleries_list,
                 css_list_klass: css_list_klass,
                 css_item_klass: css_item_klass,
                 thumb_size: thumb_size,
                 w_style: w_style,
                 h_style: h_style,
                 section_title: section_title
             }

    end

  end
end