<%@ page import="entity.Category" %>
<%@ page import="entity.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Category> categories = (List<Category>) request.getAttribute("categories");
            Category category = categories.get(Integer.valueOf(request.getParameter("categoryid")) - 1);
            List<Product> product = new ArrayList<Product>(category.getProductCollection());
        %>

        <h3> Products of <%= category.getName()%> </h3>
        <img src="img/cart.gif"</img> 0 items

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
                                <button>add to cart</button>
                            </td>
                        </tr>
                        <% }%>
                    </table>  
                </td>
            </tr> 
        </table>  
    </body>
</html>
