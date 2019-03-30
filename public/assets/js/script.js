 $(function () {
   $(window).scroll(function () {
     $('.waku').each(function () {
       var elemPos = $(this).offset().top;
       var scroll = $(window).scrollTop();
       var windowHeight = $(window).height();
       if (scroll > elemPos - windowHeight + 0) {
         $(this).addClass('scrollin').queue(function () {
           setTimeout(function () {
             $(this).dequeue();
           }, 6000);
         });
       };
     });
   });
   $(window).scroll();
 });


 $(document).ready(function () {
   var pagetop = $('.pagetop');
   $(window).scroll(function () {
     if ($(this).scrollTop() > 700) {
       pagetop.fadeIn();
     } else {
       pagetop.fadeOut();
     }
   });
   pagetop.click(function () {
     $('body, html').animate({
       scrollTop: 0
     }, 500);
     return false;
   });
 });


 function ani() {
   document.getElementById('plane').className = 'animation';
 }

 function anitwo() {
   document.getElementById('bg').className = 'animation2';
 }