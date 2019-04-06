package web.action;

import javax.servlet.http.*;


/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public abstract class Action {

    public abstract void perform(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}