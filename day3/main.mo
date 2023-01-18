import List "mo:base/List";
import Book "book";
import Utils "utils";
import Debug "mo:base/Debug";
import Iter "mo:base/Iter";

actor {
    var bookList : List.List<Book.Book> = null;
    // In main.mo create a function called add_book that takes a book as parameter and returns nothing this function should add this book to your list. 
    public func add_book(book : Book.Book) : async () {
        bookList := List.push<Book.Book>(book,bookList);
    };
    //Then create a second function called get_books that takes no parameter but returns an Array that contains all books stored in the list.
    public func get_books() : async [Book.Book] {
        List.toArray<Book.Book>(bookList);
    };

    //this is a test function 
    public func test_drop_func(array:[Nat], n : Nat) : async [Nat]{
        Utils.drop<Nat>(array, n);
    };
}
