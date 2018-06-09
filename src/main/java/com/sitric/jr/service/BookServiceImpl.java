package com.sitric.jr.service;

import com.sitric.jr.dao.BookDao;
import com.sitric.jr.model.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("bookService")
public class BookServiceImpl implements BookService{

    private BookDao bookDao;

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Book> listBooks() {
        return this.bookDao.listBooks();
    }

    @Override
    @Transactional
    public List<Integer> getPageCount() {
        return this.bookDao.getPageCount();
    }

    @Override
    @Transactional
    public List<Book> getBooksPerPage(int from, int limit) {
        return this.bookDao.getBooksPerPage(from, limit);
    }

    @Override
    @Transactional
    public void markAsRead(int id) {
        this.bookDao.markAsRead(id);
    }

    @Override
    @Transactional
    public List<Book> searchBooks(int year) {
        return this.bookDao.searchBooks(year);
    }
}
