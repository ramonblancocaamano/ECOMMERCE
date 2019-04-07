package web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import web.ViewManager;

/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class clearcartAction extends Action {

    public clearcartAction() {
    }

    @Override
    public void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        req.getSession().setAttribute("cart", null);
        ViewManager.nextView(req, resp, "init.do");
    }
}
