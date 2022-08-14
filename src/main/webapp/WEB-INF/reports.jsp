<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Rock+Salt&family=Water+Brush&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="/css/style.css">
 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<link rel="stylesheet" href="/css/clock.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet"> 

<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<div class="main">
			<div class="logo glow">
				
			<h1 id="logo">U.F.O MENU</h1>
				
			</div>
			<div class="userwelcome">
			<h1>Welcome, <c:out value="${user.userName}"/></h1>
			</div>
			
			<div id="clock" class="light">
        	<div class="display">
          	<div class="weekdays "></div>
         	<div class="ampm "></div>
          
            <div class="digits "></div>
       		</div>
    		</div>
      
<div class="menu">
	<div class="buttons">
	
		<ul id="buttons">
			<li  class="glow" id="home" title="Home">
				<a href="/home">
				<img src="https://img.icons8.com/external-jumpicon-glyph-ayub-irawan/65/664DB2/external-alien-space-jumpicon-glyph-jumpicon-glyph-ayub-irawan-4.png"/>					  
				</a>
			</li>
			
			<li class="glow" id="Add" title="Add a Sighting">
				<a href="/addUfo">
				<img src="https://img.icons8.com/external-stick-figures-gan-khoon-lay/65/664DB2/external-alien-ufo-alien-invaders-stick-figures-gan-khoon-lay-8.png"/>
				</a>
			</li>
					
			<li class="glow" id="reports" title=" the reports">
			  <a href="/reports">
			  <img src="https://img.icons8.com/pastel-glyph/65/664DB2/planet-globe.png"/>
			  </a>
			</li>
			
            <li class="glow" id="video" title="video footage">
 				 <a href="/videos">
				 <img src="https://img.icons8.com/dotty/65/664DB2/retro-tv.png"/>
				 </a>
			</li>
            
			<li class="glow" id="contact" title="Contact Me">
			<a href="/contact">
  			<img src="https://img.icons8.com/external-stick-figures-gan-khoon-lay/65/664DB2/external-alien-ufo-alien-invaders-stick-figures-gan-khoon-lay.png"/>
  			</a>
  			</li>
  			<li class="glow" id="logout" title="log out">
			<a href="/logout">
			<img src="https://img.icons8.com/external-kmg-design-detailed-outline-kmg-design/64/664DB2/external-log-out-user-interface-kmg-design-detailed-outline-kmg-design.png"/>
			</a>
  			</li>
		</ul>
	</div>
<div class="container glow">

	<div class="ufos">
	
		
		<h2>RECENT UFO SIGHTINGS</h2>
		
		
		
		
		
			
			<c:forEach var="ufo" items="${ufos}">
			
				<div class="report">
					<div class="location">
					<a  href="ufos/${ufo.id}" title="View the sighting">
					<img src="https://img.icons8.com/external-kiranshastry-solid-kiranshastry/64/664DB2
					/external-view-cyber-security-kiranshastry-solid-kiranshastry.png" class="glow ball"/>
					</a>
					</div>
						<div class="location">
							<h3><c:out value="${ufo.location}"/></h3>
							<H3>Time: <c:out value="${ufo.time}"/></H3>
						</div>
						<div class="location">
							<P><c:out value="${ufo.description}"/></P>
						</div>
						<div class="location">
							<P>Reported by:<c:out value="${ufo.user.userName}"/></p>
						</div>
				</div>
			</c:forEach>
	
		
	
	</div>
</div>
</div>

	


		 
</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.0.0/moment.min.js"></script>


		 <script>
		 $(function(){

			    // Cache some selectors

			    var clock = $('#clock'),
			        alarm = clock.find('.alarm'),
			        ampm = clock.find('.ampm');

			    // Map digits to their names (this will be an array)
			    var digit_to_name = 'zero one two three four five six seven eight nine'.split(' ');

			    // This object will hold the digit elements
			    var digits = {};

			    // Positions for the hours, minutes, and seconds
			    var positions = [
			        'h1', 'h2', ':', 'm1', 'm2', ':', 's1', 's2'
			    ];

			    // Generate the digits with the needed markup,
			    // and add them to the clock

			    var digit_holder = clock.find('.digits');

			    $.each(positions, function(){

			        if(this == ':'){
			            digit_holder.append('<div class="dots">');
			        }
			        else{

			            var pos = $('<div>');

			            for(var i=1; i<8; i++){
			                pos.append('<span class="d' + i + '">');
			            }

			            // Set the digits as key:value pairs in the digits object
			            digits[this] = pos;

			            // Add the digit elements to the page
			            digit_holder.append(pos);
			        }

			    });

			    // Add the weekday names

			    var weekday_names = 'MON TUE WED THU FRI SAT SUN'.split(' '),
			        weekday_holder = clock.find('.weekdays');

			    $.each(weekday_names, function(){
			        weekday_holder.append('<span>' + this + '</span>');
			    });

			    var weekdays = clock.find('.weekdays span');

			    // Run a timer every second and update the clock

			    (function update_time(){

			        // Use moment.js to output the current time as a string
			        // hh is for the hours in 12-hour format,
			        // mm - minutes, ss-seconds (all with leading zeroes),
			        // d is for day of week and A is for AM/PM

			        var now = moment().format("hhmmssdA");

			        digits.h1.attr('class', digit_to_name[now[0]]);
			        digits.h2.attr('class', digit_to_name[now[1]]);
			        digits.m1.attr('class', digit_to_name[now[2]]);
			        digits.m2.attr('class', digit_to_name[now[3]]);
			        digits.s1.attr('class', digit_to_name[now[4]]);
			        digits.s2.attr('class', digit_to_name[now[5]]);

			        // The library returns Sunday as the first day of the week.
			        // Stupid, I know. Lets shift all the days one position down, 
			        // and make Sunday last

			        var dow = now[6];
			        dow--;

			        // Sunday!
			        if(dow < 0){
			            // Make it last
			            dow = 6;
			        }

			        // Mark the active day of the week
			        weekdays.removeClass('active').eq(dow).addClass('active');

			        // Set the am/pm text:
			        ampm.text(now[7]+now[8]);

			        // Schedule this function to be run again in 1 sec
			        setTimeout(update_time, 1000);

			    })();

			    // Switch the theme

			    $('a.button').click(function(){
			        clock.toggleClass('light dark');
			    });

			});
		 </script>
		 
	     <script type="text/javascript">//Custom cursor to follow cursor
	     const cursor = document.querySelector('.cursor');

	     document.addEventListener('mousemove', e => {
	       cursor.setAttribute("style", "top: "+(e.pageY-15)+"px; left: "+(e.pageX-20)+"px;")
	     })

	     //Add on click pulse effect
	     function clickEffect(e){
	       var effect = document.createElement("div");
	       effect.className="cursoreffect";
	       effect.setAttribute("style", "top: "+(e.pageY-16)+"px; left: "+(e.pageX-21)+"px;")
	       document.body.appendChild(effect);
	       effect.addEventListener('animationend',function(){effect.parentElement.removeChild(effect);}.bind(this));
	     }
	     document.addEventListener('click',clickEffect);</script>



	
</body>
</html>