package com.sitric.jr.dao;

import com.sitric.jr.model.Book;

import java.util.List;

public interface BookDao {
    void addBook(Book book);            // insert
    void updateBook(Book book);         // update
    void removeBook(int id);            // delete book
    void markAsRead(int id);            //mark as read
    Book getBookById(int id);
    List<Book> listBooks();              //all books
    List<Integer> getPageCount();                //counts of records in book table
    List<Book> getBooksPerPage(int from, int limit);
    List<Book> searchBooks(int year);


}
