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
 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/login.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet"> 

<meta charset="UTF-8">
<title>Add A UFO</title>
</head>
<body>




<div class="container3">

	 <div class="login-box">
		<form:form class="form1" action="/ufos" modelAttribute="ufo" method="post">
			
			<h1 class="glow">ADD A SIGHTING</h1>
			<div class="user-box">
			
				<form:label class="glow"  for="location" path="location">Location: example: Seatle ,Wa</form:label><br/>
			 	<form:errors path="location" class="errors"/>
				<form:input type="text" path="location"/>
				
				
			</div>
			
			<div class="user-box">
				<form:label  class="glow" for="time" path="time">Time :</form:label><br/>
				<form:errors path="time" class="errors"/>
				<form:input type="datetime-local" path="time" id="datetime24" data-format="DD-MM-YYYY  HH:mm" data-template="DD / MM / YYYY     HH : mm" name="datetime"/>
			
			</div>
			
			<div class="user-box">
			
				<form:label class="glow"  for="description" path="description">Description</form:label><br/>
				<form:errors path="description" class="errors"/><br/>
				<form:textarea path="description" rows="4" cols="40"/>
			
			</div>
			<div class="user-box">
				<form:label class="glow" for="witnesses" path="witnesses">Number of witnesses:</form:label><br/>
				<form:errors path="witnesses" class="errors"/>
				<form:input type="number" path="witnesses" />
			
			</div>
			
			<div>
				<form:errors path="user" class="errors"/>
				<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			</div>
			
	
				<div class="a2">
				<span></span>
		      	<span></span>
		     	<span></span>
		      	<span></span>
				<input class="glow a3" type="submit" value="SUBMIT"/>
				</div>
			
			
			
		</form:form>
		<li  class="glow" id="home" title="Home">
					<a href="/home">
					<img src="https://img.icons8.com/external-jumpicon-glyph-ayub-irawan/65/664DB2/external-alien-space-jumpicon-glyph-jumpicon-glyph-ayub-irawan-4.png"/>					  
					</a>
		</li>
	</div>


</div>
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