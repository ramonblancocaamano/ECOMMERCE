<%@page import="cart.ShoppingCart"%>
<%@ page import="entity.Category" %>
<%@ page import="java.util.List" %>

    <head>
        <meta http-equiv="Expires" CONTENT="0">
        <meta http-equiv="Cache-Control" CONTENT="no-cache">
        <meta http-equiv="Pragma" CONTENT="no-cache">
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>eCommerce Sample</title>
    </head>
    
    <body>

        <h2>Welcome to the online home of the Affable Bean Green Grocer</h2>

        <h3> Our unique home delivery service brings you fresh organic produce,
        dairy, meats, breads and other delicious and healthy items direct
        to your doorstep. </h3>
        
        <%
            int cartNumberOfItems = 0;
            ShoppingCart shoppingCart;
            shoppingCart = (ShoppingCart) request.getSession().getAttribute("cart");
            if (shoppingCart != null) {
                cartNumberOfItems = shoppingCart.getNumberOfItems();
            }
        %>   
        <%if (cartNumberOfItems > 0) {%>
        <img src="img/cart.gif"</img> <%= cartNumberOfItems%> items 
        <a href="viewcart.do">View Cart</a>
        <br><a href="checkout.do">Proceed to checkout</a>
        <%}%>


    <table width="50%" border="1" bordercolordark="#000000" bordercolorlight="#FFFFFF" cellpadding="3" cellspacing="0">

        <tr> <font size="2" face="Verdana">

        <%
        List<Category> categories = (List<Category>)request.getAttribute("categories");

        for(Category category : categories){

        %>

        <td width="14%" valign="center" align="middle">
            <a href="category.do?categoryid=<%=category.getId()%>">
                <img src="img/categories/<%=category.getName()%>.jpg"
                     alt="<%=category.getName()%>" >
                <%=category.getName()%>
            </a>
        </td>
 
       <% } %>

        </font> </tr>

    </table>

    </body>