package web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.ViewManager;

/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class viewcartAction extends Action {

    public viewcartAction() {
    }

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        ViewManager.nextView(req, resp, "/view/cart.jsp");
    }
}
