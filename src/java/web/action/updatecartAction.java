package web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cart.ShoppingCart;
import cart.ShoppingCartItem;
import model.ProductModel;
import web.ViewManager;

/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class updatecartAction extends Action{
    
    ProductModel productModel;
    
    public updatecartAction(ProductModel productModel) {
        this.productModel = productModel;
    }

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception {

        int quantity;
        int productId;
        ShoppingCart shoppingCart;

        quantity = Integer.valueOf(req.getParameter("quantity"));
        productId = Integer.valueOf(req.getParameter("productid"));

        shoppingCart = (ShoppingCart) req.getSession().getAttribute("cart");

        for (ShoppingCartItem index : shoppingCart.getItems()) {
            if (index.getProduct().getId() != productId) 
                continue;
            
            if (quantity == 0) {
                shoppingCart.removeItem(index);
            } else {
                index.setQuantity(quantity);
            }
            break;          
        }

        if (shoppingCart.getItems() == null) {
            ViewManager.nextView(req, resp, "/clearcart.do");
            return;
        }
        ViewManager.nextView(req, resp, "/viewcart.do");
    }
}
