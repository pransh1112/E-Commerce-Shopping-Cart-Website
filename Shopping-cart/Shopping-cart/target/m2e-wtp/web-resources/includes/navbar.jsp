<nav class="navbar navbar-expand-lg navbar-light bg-dark" style="border:2px solid ; color:black; background-color:rgb(151, 248, 254);">
	<div class="container">
		<a class="navbar-brand" href="index.jsp" style="color:white">E-Commerce Cart</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="./index.jsp" style="color:white">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="./Cart.jsp" style="color:white">Cart <span class="badge badge-danger">${cart_list.size()}</span> </a></li>
				<%
				
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="Orders.jsp" style="color:white">Orders</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out" style="color:white">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp" style="color:white">Login</a></li>
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>