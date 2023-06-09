<%@page import="cn.Shinde.connection.DbCon"%>
<%@page import="cn.Shinde.dao.ProductDao"%>
<%@page import="cn.Shinde.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("person", auth);
}
ProductDao pDao = new ProductDao(DbCon.getConnection());
List<Product> products = pDao.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/includes/head.jsp"%>
<title>E-Commerce Cart</title>

<style>
a{
color:black ;
font-weight:bold;
}

</style>
</head>
<body style="background-color:rgb(151, 248, 254);">
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card-header my-3  font-weight-bold border border-5 color-white">All Products</div>
		<div class="row">
			<%
			if (! products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100" style="width:18rem;">
					<img class="card-img-top" style="height:250px" src="./Product-images/<%=p.getImage() %>"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						<h6 class="price">Price: $<%=p.getPrice() %></h6>
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						<div class="mt-3 d-flex justify-content-between">
							<a class="btn btn-dark" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>