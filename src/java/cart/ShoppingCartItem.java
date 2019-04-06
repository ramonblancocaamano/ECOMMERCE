package cart;

import entity.Product;
import java.util.*;
import javax.persistence.EntityManager;
import javax.transaction.UserTransaction;

/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class ShoppingCartItem {
    List<Product> products = new ArrayList();

    public ShoppingCartItem(Product product) {
        products.add(product);
    }

    public Product getProduct() {
        return products.get(0);       
    }
    
    /*
    public int getQuantity()

    public void setQuantity(int quantity)

    public double getTotal()
     */

}