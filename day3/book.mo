module {
    // In your file called book.mo create a custom type with at least 2 properties (title of type Text, pages of type Nat), import this type in your main.mo and create a variable that will store a book.
    public type Book = {
        title: Text;
        pages: Nat;
    };

    // In your file called book.mo create a function called create_book that takes two parameters : a title of type Text, and number of pages of type Nat and returns a book. 
    public func create_book(title: Text, pages: Nat) : Book {

      //This function will create a new book based on the parameters passed
      let newBook: Book = {
        title = title;
        pages = pages;
      };

      //and then read it before returning it.
      let t : Text = newBook.title;
      let p : Nat = newBook.pages;

    return newBook;
  }
}

