/*
Design a system that calculates transport fares based on the type of transport.

 (a) Create an abstract class Transport with attributes vehicleNumber and dis
tanceTravelled.

 (b) Include an abstract method called calculateFare() and a concrete method
 displayDetails() to show vehicle information.

 (c) Create two subclasses as follows:
         A. Class Bus to calculate the fare as:
                Bus fare = 10 × distance
         B. Class Taxi to calculate the fare as:
                Taxi fare = 20 × distance + 50 (base fee)

 (d) Override calculateFare() in each subclass and update displayDetails() to
 include fare details.
 
 (e) In the main method, create objects for both ‘Bus’ and ‘Taxi’, and display
 details.
 */

package Q1;

abstract class Transport{
    String vehicleNumber;
    int distanceTravelled;

    abstract double calculateFare();

    public void  displayDetails(){
        System.out.println("Vehicle Number      : "+vehicleNumber);
        System.out.println("Distance Travelled  : "+distanceTravelled+"km");
    }
}

class Bus extends Transport{
    double calculateFare(){
        return 10*distanceTravelled;
    }

    public void  displayDetails(){
        System.out.println("==== Display Bus Details ====");
        super.displayDetails();
        System.out.println("Fare Details        : "+calculateFare());
    }

}

class Taxi extends Transport{
    double calculateFare(){
        return 20*distanceTravelled+50;
    }

    public void displayDetails(){
        System.out.println("\n==== Display Taxi Details ====");
        super.displayDetails();
        System.out.println("Fare Details        : "+calculateFare());
    }
}

public class TransportFareSystem {
    public static void main(String[] args) {

        Bus b=new Bus();
        b.vehicleNumber="NC-6368";
        b.distanceTravelled=17;
        b.displayDetails();

        Taxi t=new Taxi();
        t.vehicleNumber="KP-3202";
        t.distanceTravelled=34;
        t.displayDetails();
    }
}
