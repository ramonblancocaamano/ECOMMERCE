<%@ page import="java.util.List" %>
<%@ page import="cart.ShoppingCart"%>
<%@ page import="cart.ShoppingCartItem"%>

<%-- 
 -- @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Cart Page</title>
    </head>

    <%
        int cartNumberOfItems;
        String totalPrice = "0.00";
        List<ShoppingCartItem> cartItems;
        ShoppingCart shoppingCart;

        shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
        cartNumberOfItems = shoppingCart.getNumberOfItems();
        cartItems = shoppingCart.getItems();
        totalPrice = Double.toString(shoppingCart.getTotal());
    %>

    <img src="img/cart.gif"</img> <%= cartNumberOfItems%> items 
    <h2> Your shopping cart contains  <%= cartNumberOfItems%> items.</h2>
    <a href="clearcart.do">Clear cart</a>
    <br><a href="init.do">Continue shopping</a> 

    <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
        <input type="hidden" name="cmd" value="_xclick">
        <input type="hidden" name="business" value="ramonblancocaamano@gmail.com">
        <input type="hidden" name="item_name" value="Item Name">
        <input type="hidden" name="currency_code" value="EUR">
        <input type="hidden" name="amount" value="<%= totalPrice%>">
        <input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
    </form>

    <table width="80%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0"> 
        <tr >
            <td>Product</td>
            <td>Name</td>
            <td>Price</td>
            <td>Quantity</td>
            </font> 
        </tr>
        <% for (ShoppingCartItem s : cartItems) {
                String name = s.getProduct().getName();
                String description = s.getProduct().getDescription();
                float price = s.getProduct().getPrice();
                int quantity = s.getQuantity();
                int id = s.getProduct().getId();
        %>
        <tr>
            <td width="14%" valign="center" align="middle">
                <img src="img/products/<%= name%>.png"</img>
            </td>
            <td width="14%" valign="center" align="middle">
                <h4><%= name%></h4>
                <%= description%>
            </td>
            <td width="14%" valign="center" align="middle">
                <%= price%> &euro;/unit</td>
            <td width="14%" valign="center" align="middle">
                <form action="updatecart.do?productid=<%= id%>" method="post">
                    <input type="text" name="quantity" value="<%= quantity%>"/>
                    <input type="submit" name="update" value="update"/>
                </form>
            </td>
        </tr>
        <% }%>
    </table> 
    <h3>Total amount: <%= totalPrice%> &euro;</h3>

</html>
