<%@page import="cart.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>

<%-- 
 -- @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>CheckOut Page</title>
    </head>
    <body>
        
        <%
            int cartNumberOfItems = 0;
            ShoppingCart shoppingCart;
            shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
            if (shoppingCart != null) {
                cartNumberOfItems = shoppingCart.getNumberOfItems();
            }
        %>
        
        <h3> <img src="img/cart.gif"</img> <%= cartNumberOfItems%> items have been purchased! </h3>
        <br><a href="clearcart.do"> Main ECOMM page</a>
    </body>
</html>
