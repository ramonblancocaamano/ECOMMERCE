<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@page import="cart.ShoppingCart"%>
<%@ page import="entity.Category" %>
<%@ page import="entity.Product" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Category Page</title>
    </head>
    <body>
        <%
            int cartItems = 0;
            List<Category> categories = (List<Category>) request.getAttribute("categories");
            Category category = categories.get(Integer.valueOf(request.getParameter("categoryid")) - 1);
            List<Product> product = new ArrayList<Product>(category.getProductCollection());

            String categoryId = (String) request.getParameter("categoryid");
            request.getSession().setAttribute("currentcatid", categoryId);
            ShoppingCart shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
            if (shoppingCart != null) {
                cartItems = shoppingCart.getNumberOfItems();
            }
        %>

        <h3> Products of <%= category.getName()%> </h3>
        <img src="img/cart.gif"</img> <%= cartItems%> items 
        <%if (cartItems > 0) {%>
        <a href="viewcart.do">View Cart</a>
        <%}%>
        <table width="80%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">
            <tr>
                <td>
                    <table width="100%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">  
                        <% for (Category c : categories) {%>
                        <tr><td><a href="category.do?categoryid=<%=c.getId()%>">
                                    <%= c.getName()%>
                                </a></td></tr>
                                <% }%>
                    </table>    
                </td>
                <td>
                    <table width="100%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">  
                        <% for (Product p : product) {%>
                        <tr>
                            <td width="14%" valign="center" align="middle">
                                <img src="img/products/<%=p.getName()%>.png"</img>
                            </td>
                            <td width="14%" valign="center" align="middle">
                                <h4><%= p.getName()%></h4>
                                <%= p.getDescription()%>
                            </td>
                            <td width="14%" valign="center" align="middle">
                                <%= p.getPrice()%> &euro;</td>
                            <td width="14%" valign="center" align="middle">
                                <form action="neworder.do?productid=<%=p.getId()%>" method="post">
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
