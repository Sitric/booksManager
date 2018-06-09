package com.sitric.jr.service;

import com.sitric.jr.model.Book;

import java.util.List;

public interface BookService {
    void addBook(Book book);           // insert
    void updateBook(Book book);        // update
    void removeBook(int id);            // delete book
    void markAsRead(int id);            //mark as read
    Book getBookById(int id);
    List<Book> listBooks();           //all books
    List<Book> searchBooks(int year); // get books by term

    List<Integer> getPageCount();               //counts of records in book table
    List<Book> getBooksPerPage(int from, int limit);
}
