<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>  

<!DOCTYPE html>
<html>
<head>


 <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/login.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet"> 

<meta charset="UTF-8">
<title>Login or Register</title>
</head>
<body>
	<div class="main">
	<div class="logo">
				
			<h1 class="logologin">UFO MENU</h1>
				
	</div>
	</div>
<div class="container1">


		 <div class="login-box">
		 
			<form:form class="form" action="/register" method="post" modelAttribute="newUser">
			<h2 class="glow">Register</h2>
			
			    <div class="user-box">
			        <form:label class="glow" path="userName"> User Name:</form:label><br/>
			        <form:errors class="errors" path="userName"/>
					<form:input class="input" path="userName"/>
			     
			    </div>
			    <div class="user-box">
			        <form:label class="glow" path="email">Email</form:label><br/>
			        <form:errors class="errors" path="email"/>
			        <form:input path="email"/>
			       
			        
			    </div>
			 	<div class="user-box">
			        <form:label  class="glow" path="password">Password</form:label><br/>
			        <form:errors class="errors" path="password"/>
			        <form:input type="password" path="password"/>
			      
			    </div>
			    <div class="user-box">
			    
			        <form:label class="glow" path="confirm">Confirm Password</form:label><br/>
			        <form:errors class="errors" path="confirm"/>
			        <form:input type="password" path="confirm"/>
			       
			     </div>
			
			    <br/>    
			   	<div class="a2">
				<span></span>
		      	<span></span>
		     	<span></span>
		      	<span></span>
				<input class="glow a3" type="submit" value="SUBMIT"/>
				</div>
				</form:form>    
		</div>
		
		<div class="login-box">
		 
			<form:form  class="form" action="/login" method="post" modelAttribute="newLogin">
			<h2 class="glow">Log-in</h2>
			
	  
			    <div class="user-box">
			    
			        <form:label class="glow input" path="email">Email:</form:label><br/>
			        <form:errors class="errors" path="email"/>
			        <form:input  path="email"/>
			  	</div>
			  	
			 	<div class="user-box">
			 	
			        <form:label class="glow input" path="password">Password:</form:label><br/>
			        <form:errors class="errors" path="password"/>
			        <form:input  type="password" path="password"/>
			    </div>
			
			    <br/>   
				<div class="a2">
				<span></span>
		      	<span></span>
		     	<span></span>
		      	<span></span>
				<input class="glow a3" type="submit" value="SUBMIT"/>
				</div>
			</form:form>   
			 
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
	     document.addEventListener('click',clickEffect);
  </script>

</body>
</html>