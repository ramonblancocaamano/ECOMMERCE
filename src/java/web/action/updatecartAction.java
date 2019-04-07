package web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        ViewManager.nextView(req, resp, "/view/cart.jsp");
    }  
}
