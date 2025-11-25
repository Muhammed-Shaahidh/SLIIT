/*
 Create a Library Management System where a Library class maintains references to the
 books it owns, and each Book object stores a reference to the Library it belongs to. The
 Book class represents a book with two attributes: isbn and title, both of type String. It
 also contains a reference to a Library object that the book belongs to. The class includes
 a parameterized constructor to initialize the ISBN and title. A setLibrary() method is
 provided to assign the library reference after creation. The displayBookDetails() method
 prints the book’s information and the name of the library (if available). The Library
 class models a library that can contain up to three books. It includes an attribute
 libraryName (String) and a Book[] array (size 3) to store references to Book objects.
 It also includes an integer variable to track how many books have been added. The
 class provides a parameterized constructor to set the library name. The addBook(Book
 book) method adds a book to the array and updates the book’s reference to the current
 library. The displayLibraryDetails() method prints the library’s name and calls each
 book’s displayBookDetails() method. In the main method, create a Library object with
 a name. Then create three Book objects with unique ISBNs and titles. Add these books
 to the library using the addBook() method. Finally, call displayLibraryDetails() to print
 the library and all book information

 A guide to implement the above scenario:

 Step 1- Create the Book Class
         • Define a class named Book with the private attributes isbn (String), title (String),
         and library (Library).
         • Add a parameterized constructor to initialize isbn and title.
         • Add a method setLibrary(Library lib) to assign the library
         • Add a method displayBookDetails() to print the book’s details and associated li
         brary.

 Step 2- Create the Library Class
         • Define a class named Library with private attributes libraryName (String), and
         bookCount (int)
         • Craete an array of Book objects as
         Book[] books = new Book[3];
         • Add a constructor to initialize the library name
         • Add a method addBook(Book book) to add the book to the array if bookCount ¡ 3
         • Call book.setLibrary(this) within addBook() to set the back-reference
         • Add a method displayLibraryDetails() to print the name and call displayBookDe
        tails() for each book

  Step 3- Implement the Main Class
         • Create a class named LibraryApp with main() method
         • Create a Library object using the constructor
         • Create 3 Book objects with different details
         • Add books to the library using addBook()
         • Finally, call displayLibraryDetails() to print all the data
 */

public class BookNew {
    private String isbn;
    private String title;
    private Library library;

    public BookNew(String isbn, String title) {
        this.isbn = isbn;
        this.title = title;
    }

    public void setLibrary(Library library) {
        this.library = library;
    }

    public void displayBookDetails(){
        System.out.println("ISBN :" +isbn);
        System.out.println("Book Title: " +title);
        if(library != null){
            System.out.println("Library: "+library.getLibraryName());
        }
        System.out.println();
    }
}

class Library{
    private String libraryName;
    private BookNew[] book = new BookNew[3];
    private int bookCount;

    public Library(String libraryName, int bookCount) {
        this.libraryName = libraryName;
        this.bookCount = 0;
        this.book = new BookNew[3];
    }

    public String getLibraryName() {
        return libraryName;
    }

    public void addBook(BookNew book){
        if(bookCount < 3){
            this.book[bookCount] = book;
            book.setLibrary(this);
            bookCount++;
        }
    }

    public void displayLibraryDetails(){
        System.out.println("Library's Name: " +libraryName);
        System.out.println("Books in this  Library: \n");
        for(int i=0; i<bookCount; i++){
            book[i].displayBookDetails();
        }
    }
}

class LibraryApp{
    public static void main(String[] args) {

        Library lib = new Library("Sree Library",25);

        BookNew b1 = new BookNew("EEE25", "Electronic");
        BookNew b2 = new BookNew("IT15","Data Structure");
        BookNew b3 = new BookNew("IT24","Algorithm");

        lib.addBook(b1);
        lib.addBook(b2);
        lib.addBook(b3);

        lib.displayLibraryDetails();

    }
}