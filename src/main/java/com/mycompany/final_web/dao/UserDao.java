/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.final_web.dao;

import com.mycompany.final_web.entities.User;
import com.mycompany.final_web.helper.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author thu26
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }

 


    //get user by email and password
    public User getUserByEmailAndPassword(String email, String password)
    {
        User user = null;
        
        try {
            
            String query="from User where userEmail=: e and userPassword=:p";
            Session session =this.factory.openSession();
            Query q =session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", password);
            
            user=(User) q.uniqueResult();
 
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();;
        }
        
        return user;
    }
    
    public List<User> getAllUsers()
    {
        Session s=this.factory.openSession();
        Query query=s.createQuery("from User");
        List<User> list=query.list();
        return list;
    }
    
    public void deleteUser(int id) {

        Session session1 = factory.openSession();
    Transaction tx = null;
    List<User> u = null;
    try {
        tx = session1.beginTransaction();
        Query query = session1.createQuery("from User as u Where u.userId = :id");
        query.setParameter("id", id);
        System.out.println("aaaaa" + id);
        u = query.list();
        session1.delete(u.get(0));
        tx.commit();
    } catch (HibernateException e) {
        if (tx != null) {
            tx.rollback();
        }

    } finally {
        session1.close();
    }

}
    
    public void updateUser(User user)
    {
         Transaction transaction = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            // start a transaction
            transaction = session.beginTransaction();
            // save the student object
            session.update(user);
            // commit transaction
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }
    
}
