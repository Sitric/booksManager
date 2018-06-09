package com.sitric.jr.controller;

import com.sitric.jr.model.Book;
import com.sitric.jr.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired
    @Qualifier(value = "bookService")
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }


    @RequestMapping(value = "books/{page}", method = RequestMethod.GET)
    public ModelAndView listBooks(@PathVariable("page") int page){
        ModelAndView mav = new ModelAndView("books", "book", new Book());
        mav.addObject("listBooks", this.bookService.getBooksPerPage((page - 1)*10, 10));
        mav.addObject("numOfPages", this.bookService.getPageCount());

        return mav;
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book){
        int lastPage = this.bookService.getPageCount().size();
        if (book.getId() == 0) {
            this.bookService.addBook(book);
        }
        else {
            this.bookService.updateBook(book);
        }
        return "redirect:/books/" + lastPage;
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id){
        this.bookService.removeBook(id);

        return "redirect:/books/1";
    }

    @RequestMapping("/read/{id}")
    public String markBookAsRead(@PathVariable("id") int id){
        this.bookService.markAsRead(id);

        return "redirect:/books/1";
    }

    @RequestMapping("/edit/{id}")
    public ModelAndView editBook(@PathVariable("id") int id){
        ModelAndView mav = new ModelAndView("books", "book", this.bookService.getBookById(id));
        mav.addObject("listBooks", this.bookService.getBooksPerPage(0, 10));
        return mav;
    }

    @RequestMapping(value = "/search" , method = RequestMethod.GET)
    public ModelAndView searchPage()
    {
        ModelAndView mav = new ModelAndView("search");
        return mav;
    }


    @RequestMapping(value = "/search/do", method = RequestMethod.POST)
    public ModelAndView search(@RequestParam("searchText") int searchText) {

        List<Book> allFound = bookService.searchBooks(searchText);

        ModelAndView mav = new ModelAndView("search", "foundBooks", allFound);
        return mav;
    }

}
