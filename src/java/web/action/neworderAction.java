package web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cart.ShoppingCart;
import entity.Product;
import model.CategoryModel;
import model.ProductModel;



/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class neworderAction extends Action {

    CategoryModel categoryModel;
    ProductModel productModel;

    public neworderAction(CategoryModel categoryModel, ProductModel productModel) {
        this.categoryModel = categoryModel;
        this.productModel = productModel;
    }

    public void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        
        ShoppingCart shoppingCart;
        Product product;
        int productId; 
        
        req.setAttribute("categories", categoryModel.retrieveAll());

        shoppingCart = (ShoppingCart) req.getSession().getAttribute("cart");
        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            req.getSession().setAttribute("cart", shoppingCart);
        }
        
        productId = Integer.parseInt(req.getParameter("productid"));
        // product =

    }

}
