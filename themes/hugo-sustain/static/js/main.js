/**
 * Created by fabiomadeira on 25/02/15.
 */
// jQuery for page scrolling feature
jQuery(document).ready(function (e) {
    e(".scroll").click(function (t) {
        t.preventDefault();
        e("html,body").animate({
            scrollTop: e(this.hash).offset().top
        }, 1e3)
    })
});
$('#middleAnimated').css('top', $(document).height() / 2);
$('#closetweet').click(function(){
    $('#tweetbox').css('display', 'none');
});

