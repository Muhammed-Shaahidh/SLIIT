/*
Build a print system where different items can be printed using a common interface.

 (a) Create an interface Printable with a method printDetails().

 (b) Create two classes called Report and Invoice, both implementing Printable
 interface in each class.

 (c) Each class should have suitable attributes (e.g., title for Report, invoiceId for
 Invoice) and constructor.

 (d) Implement printDetails() to show the specific content in each class.
 
 (e) In the main method, create two objects per Report and Invoice classes, store
 them in a Printable[ ] array and use a loop to print.
 */

package Q2;

interface Printable{
    void printDetails();
}

class Report implements Printable{
    String title;

    public Report(String title){
        this.title=title;
    }
    public void printDetails(){
        System.out.println("Report Title: "+title);
    }
}

class Invoice implements Printable{
    int invoiceId;

    public Invoice(int invoiceId){
        this.invoiceId=invoiceId;
    }
    public void printDetails(){
        System.out.println("Invoice ID: "+invoiceId);
    }
}

public class PrintingManagementSystem {
    public static void main(String[] args) {
        Printable[] printables=new Printable[4];

        printables[0]=new Report("Annual Sales Report");
        printables[1]=new Report("Project Report");

        printables[2]=new Invoice(001);
        printables[3]=new Invoice(002);

        for(int i=0;i<4;i++){
            printables[i].printDetails();

        }
    }
}
