// --------preloader--------------
$(window).on('load', function() {
	setTimeout(function() {
		$('.preloader').slideUp('slow');
		$('.cube-wrapper').fadeOut();
	}, 1000);
});


// Tooltip
$(function () {
	$('[data-toggle="tooltip"]').tooltip()
})



// Scroll To Section
$('.scroll-link').on('click',function (e) {
	e.preventDefault();

	var target = this.hash,
	$target = $(target);
	var headerHeight  = $(".header-wrapper").innerHeight();
	$('html, body').stop().animate({
		'scrollTop': $target.offset().top - headerHeight
	}, 900);
	if ($(window).width() < 1200){
		$('.menu-part').slideUp();
	}
});


// --------header--------------
$('.toggle-btn, .close-menu, .menu-overlay-bg').on('click', function(){
	$('.menu-part').slideToggle();
});


// if ($(window).width() < 1200){
// 	$(window).scroll(function(){
// 		var scroll = $(window).scrollTop();
// 		if (scroll >= 15){
// 			$('.menu-part').slideUp(300);

// 		}else{
// 			$('.menu-part').slideUp(300);

// 		}
// 	});
// }


// Multilevel Dropdown
$(".dropdown-menu > .dropdown > a").addClass("dropdown-toggle");

$(".dropdown-menu a.dropdown-toggle").on("click", function (e) {
	if (!$(this).next().hasClass("show")) {
		$(this).parents(".dropdown-menu").first().find(".show").removeClass("show");
	}
	var $subMenu = $(this).next(".dropdown-menu");
	$subMenu.toggleClass("show");
	$(this)
	.parents("li.dropdown.show")
	.on("hidden.bs.dropdown", function (e) {
		$(".dropdown-menu > .dropdown .show").removeClass("show");
	});
	return false;
});



$(window).scroll(function(){
	var headerHeight = $('.header-wrapper');
	var scroll = $(window).scrollTop();
	if (scroll >= 50){
		headerHeight.addClass('header-sticky');
	}else{
		headerHeight.removeClass('header-sticky');
	}
});


// Slider---
if ($("#host-bx-slider").length) {
	$('#host-bx-slider').slick({
		infinite: false,
		slidesToShow: 3,
		slidesToScroll: 3,
		arrows: true,
		dots: false,
		autoplay: false,
		autoplaySpeed: 8000,
		draggable: false,
		asNavFor: '#host-text-slider',
		prevArrow: '<button class="slide-arrow prev-arrow"><i class="fa fa-long-arrow-left"></i></button>',
		nextArrow: '<button class="slide-arrow next-arrow"><i class="fa fa-long-arrow-right"></i></button>',
		responsive: [
		{
			breakpoint: 576,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 2,
			}
		}
		]
	});
}
if ($("#host-text-slider").length) {
	$('#host-text-slider').slick({
		infinite: false,
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false, 
		dots: false,
		fade: true,
		autoplay: false,
		draggable: false,
		asNavFor: '#host-bx-slider',
		
	});
}




if ($("#host-img-slider").length) {
	$('#host-img-slider').slick({
		infinite: false,
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: false, 
		dots: true,
		fade: false,
		autoplay: false,
	});
}