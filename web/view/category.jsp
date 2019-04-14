<%@ page import="java.util.List" %>
<%@ page import="cart.ShoppingCart"%>
<%@ page import="entity.Category" %>
<%@ page import="entity.Product" %>

<%-- 
 -- @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Category Page</title>
    </head>
    <body>
        <%
            int cartNumberOfItems = 0;
            String totalPrice = "0.00";
            List<Category> categories;
            List<Product> products;
            ShoppingCart shoppingCart;
            Category category;
            String categoryId;
            String categoryName;

            categories = (List<Category>) request.getAttribute("categories");
            category = categories.get(Integer.valueOf(request.getParameter("categoryid")) - 1);
            products = (List<Product>) category.getProductCollection();

            categoryId = (String) request.getParameter("categoryid");
            categoryName = category.getName();
            request.getSession().setAttribute("currentcatid", categoryId);

            shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
            if (shoppingCart != null) {
                cartNumberOfItems = shoppingCart.getNumberOfItems();
                totalPrice = Double.toString(shoppingCart.getTotal());
            }
        %>

        <h3> Products of <%= categoryName%> </h3>
        <img src="img/cart.gif"</img> <%= cartNumberOfItems%> items 
        <%if (cartNumberOfItems > 0) {%>
        <a href="viewcart.do">View Cart</a>

        <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="ramonblancocaamano@gmail.com">
            <input type="hidden" name="item_name" value="Item Name">
            <input type="hidden" name="currency_code" value="EUR">
            <input type="hidden" name="amount" value="<%= totalPrice%>">
            <input type="image" src="http://www.paypal.com/es_XC/i/btn/x-click-but01.gif" name="submit" alt="Make payments with PayPal - it's fast, free and secure!">
        </form>
        <%}%>
        <table width="80%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">
            <tr>
                <td>
                    <table width="100%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">  
                        <% for (Category c : categories) {
                                String name = c.getName();
                                int id = c.getId();
                        %>
                        <tr><td><a href="category.do?categoryid=<%= id%>">
                                    <%= name%>
                                </a></td></tr>
                                <% }%>
                    </table>    
                </td>
                <td>
                    <table width="100%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">  
                        <% for (Product p : products) {
                                String name = p.getName();
                                String description = p.getDescription();
                                float price = p.getPrice();
                                int id = p.getId();
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
                                <%= price%> &euro;</td>
                            <td width="14%" valign="center" align="middle">
                                <form action="neworder.do?productid=<%= id%>" method="post">
                                    <input type="submit" name="addtocart" value="add to cart"/>
                                </form>
                            </td>
                        </tr>
                        <% }%>
                    </table>  
                </td>
            </tr> 
        </table>  
    </body>
</html>
