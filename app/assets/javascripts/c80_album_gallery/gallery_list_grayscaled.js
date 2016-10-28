$(document).ready(function () {

    var $gallery_list_grayscaled = $('.gallery_list_grayscaled');
    //console.log('<$gallery_list_grayscaled>');
    //console.log($gallery_list_grayscaled);

    if ($gallery_list_grayscaled.length) {
        //console.log('<+>');

        setTimeout(function () {
            //console.log('<setTimeout>');
            $gallery_list_grayscaled.find('a.gray').addClass('my_fade');
        },1000);
    }

});