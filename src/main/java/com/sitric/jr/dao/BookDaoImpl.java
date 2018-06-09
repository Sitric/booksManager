package com.sitric.jr.dao;

import com.sitric.jr.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import org.hibernate.query.Query;

import java.util.ArrayList;
import java.util.List;

@Repository
@SuppressWarnings("unchecked")
public class BookDaoImpl implements BookDao {
    private static final Logger logger = LoggerFactory.getLogger(BookDaoImpl.class);

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(book);
        logger.info("Book successfully saved. Book details: " + book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(book);
        logger.info("Book successfully update. Book details: " + book);
    }

    @Override
    public void removeBook(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));

        if(book!=null){
            session.delete(book);
        }
        logger.info("Book successfully removed. Book details: " + book);
    }

    @Override
    public void markAsRead(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Query q = session.createQuery("update Book set readAlready = true where id = :id");
        q.setParameter("id", id);
        int result = q.executeUpdate();

        logger.info("Book with id = " + id + " mark as read");
    }

    @Override
    public Book getBookById(int id) {
        Session session =this.sessionFactory.getCurrentSession();
        Book book = (Book) session.load(Book.class, new Integer(id));
        logger.info("Book successfully loaded. Book details: " + book);

        return book;
    }

    @Override
    public List<Book> searchBooks(int year) {
        Session session = this.sessionFactory.getCurrentSession();
        Query q = session.createQuery("from Book where printYear = :printYear");
        q.setParameter("printYear", year);
        return q.list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> listBooks() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Book> bookList = session.createQuery("from Book", Book.class).list();

        for(Book book: bookList){
            logger.info("Book list: " + book);
        }

        return bookList;
    }

    @Override
    public List<Integer> getPageCount() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Integer> countOfPages = new ArrayList<Integer>();

        int numBooks = ((Long)session.createQuery("select count(*) from Book").uniqueResult()).intValue();
        int numPages = (int) Math.ceil(numBooks/10.0);

        for (int i = 1; i <= numPages; i++) {
            countOfPages.add(i);
        }

        return countOfPages;
    }

    @Override
    public List<Book> getBooksPerPage(int from, int limit) {
        Session session = this.sessionFactory.getCurrentSession();

        Query q = session.createQuery("from Book");
        q.setFirstResult(from);
        q.setMaxResults(limit);
        return q.list();
    }
}
