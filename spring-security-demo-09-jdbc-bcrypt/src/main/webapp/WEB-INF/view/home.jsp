<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<title>Luv2code Course Home Page</title>
</head>
<body>
	<h2>Luv2code Course Home Page - Yoohoo!!!</h2>
	<hr>
	<p>
	Wellcome to the Luv2code Course Home Page!
	</p>
	<hr>
		<!-- Display user name and role -->
		<p>
			User:<security:authentication property="principal.username"/>
			<br><br>
			Role(s):<security:authentication property="principal.authorities"/>
		</p>
		
		<security:authorize access="hasRole('MANAGER')">
		
		<!-- Add a link point to /leaders .. this is for the manager -->	
		<p>
			<a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
			(Only for manager peeps)
		</p>
		</security:authorize>
		
		<security:authorize access="hasRole('ADMIN')">
		
		<!-- Add a link to point to /systems ... this for the admins -->
		<p>
			<a href="${pageContext.request.contextPath}/systems">IT Systems Meeting</a>
			(Only for Admin peeps)
		</p>
		</security:authorize>
		
	<hr>
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" 
				method="POST">
				<input type="submit" value="Logout"/>
	</form:form>
</body>
</html>