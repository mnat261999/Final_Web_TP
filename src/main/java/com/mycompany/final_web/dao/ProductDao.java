/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.final_web.dao;

import com.mycompany.final_web.entities.Product;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author thu26
 */
public class ProductDao {
     private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public boolean saveProduct(Product product)
    {
        boolean f = false;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        return f;
    }
    
    
    //get all products
    
    public List<Product> getAllProducts()
    {
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product");
        List<Product> list=query.list();
        return list;
    }
    
    //get all products of category
    public List<Product> getAllProductsById(int cid)
    {
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product as p Where p.category.categoryId =:id");
        query.setParameter("id", cid);
        List<Product> list=query.list();
        return list;

    }
    
   public void deleteProduct(int id) {

        Session session1 = factory.openSession();
        Transaction tx = null;
        List<Product> p = null;
    try {
        tx = session1.beginTransaction();
        Query query = session1.createQuery("from Product as p Where p.pId =:id");
        query.setParameter("id", id);
        System.out.println("aaaaa" + id);
        p = query.list();
        session1.delete(p.get(0));
        tx.commit();
    } catch (HibernateException e) {
        if (tx != null) {
            tx.rollback();
        }

    } finally {
        session1.close();
    }

    }
    
    
    
}
