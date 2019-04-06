package model;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.transaction.UserTransaction;
import java.util.List;
import entity.Product;

/**
 * @Author: BLANCO CAAMANO, Ramon <ramonblancocaamano@gmail.com>
 */
public class ProductModel {

    UserTransaction utx;
    EntityManager em;

    public ProductModel(EntityManager em, UserTransaction utx) {
        this.utx = utx;
        this.em = em;
    }
    
    public void create(Product product) throws Exception {
        utx.begin();
        em.persist(product);
        em.flush();
        utx.commit();
    }
    
    public void update(Product product) throws Exception {
        utx.begin();
        em.merge(product);
        em.flush();
        utx.commit();
    }
    
    public void delete(Product product) throws Exception {
        utx.begin();
        em.detach(product);
        em.flush();
        utx.commit();
    }
    
    public Product retrieve(int id) {
       return em.find(Product.class, id);
    }
    
    public List<Product> retrieveProductsbyCategory(String name) throws Exception {
        Query query = em.createQuery("SELECT o FROM Product AS o WHERE o.name=:name");
        query.setParameter("name", name);
        return query.getResultList();
    }

    public List<Product> retrieveAll() {
        Query query = em.createQuery("SELECT p FROM Product p");
        return query.getResultList();
    }
    
}
