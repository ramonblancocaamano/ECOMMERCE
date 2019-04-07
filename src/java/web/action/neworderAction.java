package web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cart.ShoppingCart;
import entity.Product;
import model.CategoryModel;
import model.ProductModel;
import web.ViewManager;



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

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        
        ShoppingCart shoppingCart;
        Product product;
        int productId;
        String catogoryId;
        
        req.setAttribute("categories", categoryModel.retrieveAll());

        shoppingCart = (ShoppingCart) req.getSession().getAttribute("cart");
        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            req.getSession().setAttribute("cart", shoppingCart);
        }
        
        productId = Integer.parseInt(req.getParameter("productid"));
        product = productModel.retrieve(productId);
        shoppingCart.addItem(product);
        
        catogoryId = (String)req.getSession().getAttribute("currentcatid");
        ViewManager.nextView(req, resp, "category.do?categoryid=" + catogoryId);
    }
}
