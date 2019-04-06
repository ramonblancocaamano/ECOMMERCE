package web.action;

import javax.servlet.http.*;
import model.CategoryModel;
import web.ViewManager;

/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class initAction extends Action {

    CategoryModel categoryModel;

    public initAction(CategoryModel categoryModel){
        this.categoryModel = categoryModel;
    }

    public void perform(HttpServletRequest req, HttpServletResponse resp) {
        req.setAttribute("categories", categoryModel.retrieveAll());
        ViewManager.nextView(req, resp, "/view/init.jsp");
    }
}
