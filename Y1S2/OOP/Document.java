/*
Develop a Printing System where a Printer class uses a Document object temporarily to
 print its content. This represents a dependency relationship, where the Printer depends
 on the Document only during method execution and does not store it as an attribute.
 The Document class represents a simple document with two attributes: title and content,
 both of type String. It provides a parameterized constructor to initialize these attributes.
 A method called displayDocument() prints the title and content of the document. The
 Printer class models a device that prints documents. It does not store any long-term
 reference to the Document object. Instead, it contains a method named printDocu
ment(Document doc) that accepts a Document object as a parameter and uses it inside
 the method body to print the document details. This demonstrates a weak, short-lived
 dependency relationship. In the main method, create a Document object and pass it to a
 Printer object using the printDocument() method. The method should print a message
 indicating that the document is being printed and then display the document’s content.

 Step 1– Create the Document Class
         • Define a class Document with private attributes title (String), content (String)
         • Add a constructor and displayDocument() method

 Step 2– Create the Printer Class
         • Define a class named Printer.
         • Add a method printDocument(Document doc) that:
                – Prints a message like “Printing document: [title]”
                – Calls displayDocument() method on the doc object
 Step 3– Implement the Main Class
         • Create a class named PrinterApp with the main() method.
         • Create a Document object using the constructor.
         • Create a Printer object.
         • Call printDocument() by passing the Document object.
 */

public class Document {
    private String title;
    private String content;

    public Document(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public void displayDoucument(){
        System.out.println("Title: " +title);
        System.out.println("Content: " +content);
    }
}

class Printer{

    public void printDocument(Document doc){
        doc.displayDoucument();
    }
}

class PrinterApp{
    public static void main(String[] args) {

        Document document = new Document("Printing Document","Headlines");

        Printer printer = new Printer();

        printer.printDocument(document);


    }
}