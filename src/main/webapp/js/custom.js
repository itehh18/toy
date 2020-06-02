jQuery(document).ready(function($){
	
	function goToByScroll(id){
	      // Remove "link" from the ID
	    id = id.replace("link", "");
	      // Scroll
	    $('html,body').animate({
	        scrollTop: $("#"+id).offset().top},
	        'slow');
	}
	
	$('.nav > li > a').click(function(){
		
		goToByScroll($(this).attr('class'));
				
	});
		
});	



/* -------------------- Check Browser --------------------- */

function browser() {
	
	//var isOpera = !!(window.opera && window.opera.version);  // Opera 8.0+
	//var isFirefox = testCSS('MozBoxSizing');                 // FF 0.8+
	var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0;
	    // At least Safari 3+: "[object HTMLElementConstructor]"
	var isChrome = !isSafari && testCSS('WebkitTransform');  // Chrome 1+
	//var isIE = /*@cc_on!@*/false || testCSS('msTransform');  // At least IE6

	function testCSS(prop) {
	    return prop in document.documentElement.style;
	}
	
	if (isSafari || isChrome) {
		
		return true;
		
	} else {
		
		return false;
		
	}
	
}

/* -------------------- Charts --------------------- */

jQuery(document).ready(function($){
		
	function randNum(){
		return (Math.floor( Math.random()* (1+40-20) ) ) + 20;
	}
	
	if($("#stockPrice").length)
	{
		var price = [[1, randNum()-10], [2, randNum()-10], [3, randNum()-10], [4, randNum()],[5, randNum()],[6, 4+randNum()],[7, 5+randNum()],[8, 6+randNum()],[9, 6+randNum()],[10, 8+randNum()],[11, 9+randNum()],[12, 10+randNum()],[13,11+randNum()],[14, 12+randNum()],[15, 13+randNum()],[16, 14+randNum()],[17, 15+randNum()],[18, 15+randNum()],[19, 16+randNum()],[20, 17+randNum()],[21, 18+randNum()],[22, 19+randNum()],[23, 20+randNum()],[24, 21+randNum()],[25, 14+randNum()],[26, 24+randNum()],[27,25+randNum()],[28, 26+randNum()],[29, 27+randNum()], [30, 31+randNum()]];

		var plot = $.plot($("#stockPrice"),
			   [ { data: price, label: "price" } ], {
				   series: {
					   lines: { show: true,
								lineWidth: 2,
								fill: true, fillColor: { colors: [ { opacity: 0.5 }, { opacity: 0.2 } ] }
							 },
					   points: { show: true },
					   shadowSize: 1
				   },
				   grid: { hoverable: true, 
						   clickable: true, 
						   tickColor: "#eee",
						   borderWidth: 0,
						 },
				   colors: ["#414141"],
					xaxis: {ticks:11, tickDecimals: 0},
					yaxis: {tickFormatter: function (v) { return v + "USD"; }},
				 });

		function showTooltip(x, y, contents) {
			$('<div id="tooltip">' + contents + '</div>').css( {
				position: 'absolute',
				display: 'none',
				top: y + 5,
				left: x + 5,
				border: '1px solid #fdd',
				padding: '2px',
				'background-color': '#dfeffc',
				opacity: 0.80
			}).appendTo("body").fadeIn(200);
		}

		var previousPoint = null;
		$("#stockPrice").bind("plothover", function (event, pos, item) {
			$("#x").text(pos.x.toFixed(2));
			$("#y").text(pos.y.toFixed(2));

				if (item) {
					if (previousPoint != item.dataIndex) {
						previousPoint = item.dataIndex;

						$("#tooltip").remove();
						var x = item.datapoint[0].toFixed(2),
							y = item.datapoint[1].toFixed(2);

						showTooltip(item.pageX, item.pageY,
									item.series.label + " of " + x + " = " + y);
					}
				}
				else {
					$("#tooltip").remove();
					previousPoint = null;
				}
		
		});
		
	}

});

/* -------------------- Search --------------------- */

jQuery(document).ready(function($){
	
	$('.search > :input').on('keyup',function(){
		
		$(this).attr('class', 'activeSearch');

		var count;
		var timeToEnd = 1000;

		$(':input').keydown(function(){

			clearTimeout(count);

			count = setTimeout(endCount, timeToEnd);

		});

	});

	function endCount(){

		$('.search > :input').attr('class','search-form');

	}

});

/* -------------------- Buttons 3D Style --------------------- */

jQuery(document).ready(function($){

	$(':button').each(function(){

		if($(this).hasClass('btn')) {

			$(this).wrap('<div class="btn-overlay" />');

			var inner = $(this).html();
			
			if(browser()) {

				$(this).html('<span>' + inner + '</span>');
				
			}	

		}

	});
	
		
	$('a').each(function(){

		if($(this).hasClass('btnOverlay')) {
			
			$(this).wrap('<div class="btn-overlay" />');

			var inner = $(this).html();
			
			if(browser()) {

				$(this).html('<span>' + inner + '</span>');
				
			}	

		}

	});

});

/* -------------------- Twitter --------------------- */

jQuery(document).ready(function($){
	
	$.getJSON('http://api.twitter.com/1/statuses/user_timeline/lukaszholeczek.json?count=3&callback=?', function(tweets){
		$("#twitter").html(tz_format_twitter(tweets));
	}); 

});

jQuery(document).ready(function($){
	
	/* ------------------- Fancybox --------------------- */

	(function() {

		$('[rel=image]').fancybox({
			type        : 'image',
			openEffect  : 'fade',
			closeEffect	: 'fade',
			nextEffect  : 'fade',
			prevEffect  : 'fade',
			helpers     : {
				title   : {
					type : 'inside'
				}
			}
		});

		$('[rel=image-gallery]').fancybox({
			nextEffect  : 'fade',
			prevEffect  : 'fade',
			helpers     : {
				title   : {
					type : 'inside'
				},
				buttons  : {},
				media    : {}
			}
		});


	})();
	
	
	/* ------------------- Client Carousel --------------------- */

	$('.clients-carousel').flexslider({
	    animation: "slide",
		easing: "swing",
	    animationLoop: true,
	    itemWidth: 200,
	    itemMargin: 1,
	    minItems: 1,
	    maxItems: 8,
		controlNav: false,
		directionNav: false,
		move: 2
      });


	/* ------------------ Back To Top ------------------- */

	jQuery('#under-footer-back-to-top a').click(function(){
		jQuery('html, body').animate({scrollTop:0}, 300); 
		return false; 
	});
	

	/* --------------------- Tabs ------------------------ */	

		(function() {

			var $tabsNav    = $('.tabs-nav'),
				$tabsNavLis = $tabsNav.children('li'),
				$tabContent = $('.tab-content');

			$tabsNav.each(function() {
				var $this = $(this);

				$this.next().children('.tab-content').stop(true,true).hide()
													 .first().show();

				$this.children('li').first().addClass('active').stop(true,true).show();
			});

			$tabsNavLis.on('click', function(e) {
				var $this = $(this);

				$this.siblings().removeClass('active').end()
					 .addClass('active');

				$this.parent().next().children('.tab-content').stop(true,true).hide()
															  .siblings( $this.find('a').attr('href') ).fadeIn();

				e.preventDefault();
			});

		})();
		
			
});

$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});

/* ------------------ Tooltips ----------------- */

jQuery(document).ready(function() {

    $('.tooltips').tooltip({
      selector: "a[rel=tooltip]"
    })

});

/* ------------------ Progress Bar ------------------- */	

jQuery(document).ready(function($){
	
	$(".meter > span").each(function() {
		$(this)
		.data("origWidth", $(this).width())
		.width(0)
		.animate({
			width: $(this).data("origWidth")
		}, 1200);
	});
});

/* ------------------ Image Overlay ----------------- */

jQuery(document).ready(function () {
	
	$('.picture').hover(function () {
		$(this).find('.image-overlay-zoom, .image-overlay-link, .image-overlay-lock').stop().fadeTo(150, 1);
	},function () {
		$(this).find('.image-overlay-zoom, .image-overlay-link, .image-overlay-lock').stop().fadeTo(150, 0);
	});
	
});

/* -------------------- Isotope --------------------- */


//external js: isotope.pkgd.js, imagesloaded.pkgd.js


//init Isotope
var $grid = $('#diary-wrapper').isotope({
	itemSelector: '.diary-item',
	masonry: {
	}
});

//layout Isotope after each image loads
$grid.imagesLoaded().progress( function() {
	
	$grid.isotope('layout');
	
});


var $grid = $('#diary-wrapper').isotope({
	  itemSelector: '.diary-item',
	//  layoutMode: 'fitRows',
	});


	// bind filter button click
	$('#filters').on( 'click', 'button', function() {
		
	  var filterValue = $( this ).attr('data-filter');
	  // use filterFn if matches value
	 // filterValue = filterFns[ filterValue ] || filterValue;
	  $('#diary-wrapper').isotope({ filter: filterValue });
	});


	// change is-checked class on buttons
	$('.filter-button').each( function( i, buttonGroup ) {
	  var $buttonGroup = $( buttonGroup );
	  $buttonGroup.on( 'click', 'button', function() {
	    $buttonGroup.find('.is-checked').removeClass('is-checked');
	    $( this ).addClass('is-checked');
	  });
	});
	
	
	
	
	
	
//loads more posts
function loadMorePosts(str) {
	
//	img = "<img src='"+path+"/upload/"+img+"' alt='' class='dcover'/>";
//	window.alert(str);
//	str = pre+img+post
	//set.forEach(function(x) {
//	 window.alert(x);
	  $('#diary-wrapper').append(str).imagesLoaded(function() {
	    $('#diary-wrapper').isotope( 'appended', str ).isotope('reloadItems').isotope({ filter: '*' });
	  });
//	startSet = endSet;
//	endSet+=9;
};







/*
//jQuery(document).ready(function () {

	//모든 이미지가 로드되면 실행 할 함수
	$('#diary-wrapper').imagesLoaded(function() {
		var $container = $('#diary-wrapper');
			$select = $('#filters select');

	
		// initialize Isotope
		$container.isotope({
		// options...
		resizable: false, // disable normal resizing
		// set columnWidth to a percentage of container width
	  	masonry: { columnWidth: $container.width() / 12 }
		});

		
		// update columnWidth on window resize
		$(window).resize(function(){
		
			$container.isotope({
			// update columnWidth to a percentage of container width
			masonry: { columnWidth: $container.width() / 12 }
			});
		});
	

		$container.isotope({
			itemSelector : '.diary-item'
		});
		
		

		$select.change(function() {
			window.alert("???");
			var filters = $(this).val();

				$container.isotope({
					filter: filters
				});
			
			});

			var $optionSets = $('#filters .option-set'),
		  	$optionLinks = $optionSets.find('a');

		  	$optionLinks.click(function(){
			
				var $this = $(this);
				// don't proceed if already selected
				if ( $this.hasClass('selected') ) {
			  		return false;
				}
				
				
			var $optionSet = $this.parents('.option-set');
			$optionSet.find('.selected').removeClass('selected');
			$this.addClass('selected');

			// make option object dynamically, i.e. { filter: '.my-filter-class' }
			var options = {},
				key = $optionSet.attr('data-option-key'),
				value = $this.attr('data-option-value');
			// parse 'false' as false boolean
			value = value === 'false' ? false : value;
			options[ key ] = value;
			if ( key === 'layoutMode' && typeof changeLayoutMode === 'function' ) {
			  // changes in layout modes need extra logic
			  changeLayoutMode( $this, options )
			} else {
			  // otherwise, apply new options
			  $container.isotope( options );
			}

			return false;
			
		  });
		
//	});
	
	
	
});


/* -------------------- ajax scroll paging add item --------------------- */

function callbackDiarydays(data, path){
	
	//var id = data.userInfo.member_id;
    var total = data.total;
    var totalpnum = Math.ceil(total/20);
    var addpoint = $("table>tbody");
    var str = "";
    
	var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : data.total,
            eventName : "selectdaylist"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var pageNo = $("#pagenum").val();
        var i=1;
        var num = pageNo*20-20 ;

        var title="";
        $.each(data.dayList, function(key, value){
        	if(num < 0)
        		num = 0;
       // 	var day_time = getDateString(value.day_time);
       // 	var time = getDateString(value.time);
            var reCount = 0;
        	$.each(data.replyCount, function(key, reply){
        		if(reply.day_num == value.day_num)
        			reCount = reply.count;
        		
        	});
        	
        	if(reCount>0)
        		title = value.day_title+"("+reCount+")";
        	else
        		title = value.day_title;
        	
        	str += "<tr id'"+(num+i)+"'>"+
        			"<td>" + value.day_num + "</td>"+
        			"<td class='title'>" +
        				"<a href='#'"+(num+i)+"' name='title' onclick='openDayDetail("+value.day_num+","+(num+i)+")'>" 
        				+ title+"</a></td>"+
        			"<td>" + value.day_time + "</td>"+
        			"<td>" + value.time + "</td>"+
        			"<td>" + value.hits + "</td>";
        	
        });
        var anchor = "<a id='page"+pageNo+"'>";
        addpoint.append(str);
}


function callbackMydiary(data, path){
	
	var id = data.userInfo.member_id;
    var total = data.total;
    var totalpnum = Math.ceil(total/9);
    var addpoint = $("#diary-wrapper");
    
	var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : data.total,
            eventName : "selectMydiaryList"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var preimg = "";
        var img="";
        var postimg ="";
        var pageNo = $("#pagenum").val();
        var i=1;
        var num = pageNo*9-9 ;
    	var className = null;
        
        
        $.each(data.diaryList, function(key, value){
        	var basicClass = "span4 diary-item html5 css3 responsive ";
            var pro = 0;
            
        	if(num < 0)
        		num = 0;
        //	var start = getDateString(value.start_day);
        //	var end = getDateString(value.end_day);
        	
        	$.each(data.progress, function(key, prog){
        		if(prog.diary_volum == value.diary_volum)
        			pro = prog.percent;
        	});
        	
        	
        	if(pro == 100)
        		basicClass = basicClass+"full ";
        	
        	//지역에 따라 클래스 이름 추가
    		if((value.location_code).indexOf('i')>-1){
    			className = basicClass+"internal";
    		} else if((value.location_code).indexOf("o")>-1){
    			className = basicClass+"foreign";
    		}
        	
        //	var dtm = GetDateString(value.CREA_DTM);
            preimg = "<div id='diary' class='"+className+"'>"+
            		"<div class='picture'id='"+ (num + i)+"'>"+
            		"<a href='/TravelDiary/td/diarydays.do?dvol="+value.diary_volum+"&mnum="+value.member_num+"'>";
            img=     "<img src='"+path+value.diary_cover+"' alt='' class='dcover'/>"; 
            postimg=            "<div class='image-overlay-link'></div></a>"+
                        	"<div class='item-description alt'>" +
	                        	"<h5><a href='diarydays.jsp?dvol="+value.diary_volum+"'>"+value.diary_title +"</a></h5>"+
	                        	"<p>"+value.start_day+"-"+value.end_day+"<br>"+
	                        	"vol."+value.diary_volum+"</p>"+
                        	"</div>" +
                        "</div>"+
                    "</div>"+
                    "</div>";
                    i++;
                    loadMorePosts(preimg+img+postimg);
        });
        var anchor = "<a id='page"+pageNo+"'>";

}


function callbackDiaryList(data, path){
	
    var total = data.total;
    var totalpnum = Math.ceil(total/9);
    var addpoint = $("#diary-wrapper");
    
	var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : data.total,
            eventName : "selectDiaryList"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var preimg = "";
        var img="";
        var postimg ="";
        var pageNo = $("#pagenum").val();
        var i=1;
        var num = pageNo*9-9 ;
    	var className = null;
        
        
        $.each(data.diaryList, function(key, value){
            var pro = 0;
        	var basicClass = "span4 diary-item html5 css3 responsive ";
        	
        	if(num < 0)
        		num = 0;
        //	var start = getDateString(value.start_day);
        //	var end = getDateString(value.end_day);
        	
        	$.each(data.progress, function(key, prog){
        		if(prog.diary_volum == value.diary_volum)
        			pro = prog.percent;
        	});
        	
        	
        	if(pro == 100)
        		basicClass = basicClass+"full ";
        	
        	//지역에 따라 클래스 이름 추가
    		if((value.location_code).indexOf('i')>-1){
    			className = basicClass+"internal";
    		} else if((value.location_code).indexOf("o")>-1){
    			className = basicClass+"foreign";
    		}
        	
        //	var dtm = GetDateString(value.CREA_DTM);
            preimg = "<div id='diary' class='"+className+"'>"+
            		"<div class='picture'id='"+ (num + i)+"'>"+
            		"<a href='/TravelDiary/td/diarydays.do?dvol="+value.diary_volum+"&mnum="+value.member_num+"'>";
            img=     "<img src='"+path+value.diary_cover+"' alt='' class='dcover'/>"; 
            postimg=            "<div class='image-overlay-link'></div></a>"+
                        	"<div class='item-description alt'>" +
	                        	"<h5><a href='diarydays.jsp?dvol="+value.diary_volum+"'>"+value.diary_title +"</a></h5>"+
	                        	"<p>"+value.start_day+"-"+value.end_day+"<br><b>"+
	                        	value.member_num + "</b>  vol."+value.diary_volum+"</p>"+
                        	"</div>" +
                        "</div>"+
                    "</div>"+
                    "</div>";
                    i++;
                    loadMorePosts(preimg+img+postimg);
        });
        var anchor = "<a id='page"+pageNo+"'>";

}

function callbackDayList(data){
	
    var total = data.total;
    var totalpnum = Math.ceil(total/9);
    var addpoint = $("table>tbody");
    
	var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : data.total,
            eventName : "selectDayList"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var pageNo = $("#pagenum").val();
        var i=1;
        var num = pageNo*20-20 ;

        var title="";
        var str="";
        
        $.each(data.dayList, function(key, value){
        	if(num < 0)
        		num = 0;
            var reCount = 0;
        	
        	$.each(data.replyCount, function(key, reply){
        		
        		if(value.day_num == reply.day_num){
        			reCount = reply.count;
        		}
        	});
        	
        	if(reCount>0)
        		title = value.day_title+"("+reCount+")";
        	else
        		title = value.day_title;
        	
        	str += "<tr id'"+(num+i)+"'>"+
        			"<td>" + value.day_num + "</td>"+
        			"<td style='text-align:left; padding-left:5%'>" +
        				"<a href='#'"+(num+i)+"' name='title' onclick='openDayDetail("+value.day_num+","+(num+i)+")'>" 
        				+ title+"</a></td>"+
        			"<td>" + value.member_num + "</td>" +
        			"<td>" + value.day_time + "</td>"+
        			"<td>" + value.time + "</td>"+
        			"<td>" + value.hits + "</td>"+
        			"</tr>";
        	
        });
        var anchor = "<a id='page"+pageNo+"'>";
        addpoint.append(str);
}

function callbackReplyList(data){
	
    var total = data.total;
    var totalpnum = Math.ceil(total/9);
    var addpoint = $("#addlist");
    
	var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : data.total,
            eventName : "selectReplyList"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var repageNo = $("#repagenum").val();
        var i=1;
        var num = repageNo*20-20 ;

        var str="";
        var btn="";
        
        $.each(data.replyList, function(key, value){
        	if(num < 0)
        		num = 0;
            var reCount = 0;
            
        	
        	str += "<tr>"+
        			"<td><b>" + value.member_id + "</b></td> "+
        			"<td><input class='reply' type='text' readonly='readonly' style='border:none;' "+"" +
        					"value='"+value.reply+"' id='re"+value.reply_num+"<%=re%>'></td>" +
        			"<td>" + value.time + "</td>"+
        			"</tr>";
        	
        });
        var anchor = "<a id='page"+repageNo+"'>";
        addpoint.append(str);
}

function callbackReplyInsert(data){
	
    var total = data.total;
    var totalpnum = Math.ceil(total/9);
    var addpoint = $("#addlist");
    
	var params = {
            divId : "pagenav",
            pageIndex : "pagenum",
            totalCount : data.total,
            eventName : "selectReplyList"
        };
        gfn_renderPaging(params);
         
        //값을 가져와서 뿌려주는 부분
        var repageNo = $("#repagenum").val();
        var i=1;
        var num = repageNo*20-20 ;

        var str="";
        var btn="";
        
        $.each(data.replyList, function(key, value){
        	if(num < 0)
        		num = 0;
            var reCount = 0;
            
        	
        	str += "<tr>"+
        			"<td><b>" + value.member_id + "</b></td> "+
        			"<td><input class='reply' type='text' readonly='readonly' style='border:none;' "+"" +
        					"value='"+value.reply+"' id='re"+value.reply_num+"<%=re%>'></td>" +
        			"<td>" + value.time + "</td>"+
        			"</tr>";
        	
        });
        var anchor = "<a id='page"+repageNo+"'>";
        addpoint.append(str);
}
