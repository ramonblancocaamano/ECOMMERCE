package cart;

import entity.Product;
import java.util.List;
import java.util.ArrayList;


/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class ShoppingCart {

    List<ShoppingCartItem> shoppingCartItems;

    public ShoppingCart() {
        shoppingCartItems = new ArrayList<ShoppingCartItem>();
    }

    public synchronized void addItem(Product product) {
        String name; 
        String name_iter;
        int quantity;
                
        name = product.getName();
       
        for (ShoppingCartItem index : shoppingCartItems) {
            name_iter = index.getProduct().getName();
            
            if(name_iter.equals(name)) {
                quantity = index.getQuantity() + 1;
                index.setQuantity(quantity);
                return;
            }
        }
        
        shoppingCartItems.add(new ShoppingCartItem(product));
    }
    
    public synchronized void removeItem(ShoppingCartItem shoppingCartItem) {
        shoppingCartItems.remove(shoppingCartItem);
        if (shoppingCartItems.isEmpty()) {
            shoppingCartItems = null;
        }
    }

    public synchronized void update(Product product, String quantity) {
        for (ShoppingCartItem index : shoppingCartItems) {
            if (index.getProduct().equals(product)) {
                index.setQuantity(Integer.parseInt(quantity));
                return;
            }
        }  
    }
    
    public synchronized List<ShoppingCartItem> getItems() {
        return shoppingCartItems;
    }

    public synchronized int getNumberOfItems() {
        int numberOfItems = 0;
        for (ShoppingCartItem index : shoppingCartItems) {
            numberOfItems += index.quantity;
        }
        return numberOfItems;
    }

    public synchronized double getTotal() {
        double price = 0;
        
        for (ShoppingCartItem index : shoppingCartItems) {
            price += index.getTotal();
        }
        price = Math.round(price * 100.0) / 100.0;
        
        return price;
    }

    public synchronized void clear() {
        shoppingCartItems.clear();
    }

}
