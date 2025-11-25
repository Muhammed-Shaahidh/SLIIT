/*
 Implement a Hotel Booking System to manage different types of room bookings and
 calculate the cost of a guest’s stay. The hotel offers two types of rooms: Standard Rooms
 and Luxury Suites. While standard rooms offer basic facilities, luxury suites include extra
 services like airport pickup and breakfast.

 a) Create a class called Room with attributes for the room number, guest name, and
 number of nights stayed. This class should also include both a default constructor
 and a parameterized constructor to initialize room data.
        i. Add a method named displayRoomDetails() in the Room class that prints out
           all relevant room and guest details.
        ii. Implement method overloading for a method called calculateRoomCost().
                • The first version should return a default per-night cost of $150.00.
                • The second version should accept a discount per night as an integer and
                  return the total cost after applying that discount.
 [Hint: You should call the first method inside the second to retrieve the
 base rate.]

 b) Create a subclass called StandardRoom that inherits from Room and includes an
 additional attribute to indicate whether Wi-Fi is included.
         i. Override the calculateRoomCost() method to return the total as 100 times the
         number of nights.
         ii. Override displayRoomDetails() to include the Wi-Fi status and total cost.

 c) Implement another subclass called LuxurySuite that also inherits from Room and
 add an attribute to indicate whether breakfast and airport pickup are included.
         i. Override calculateRoomCost() to return the total as 200 times the number of
         nights, plus an additional $75 if extra services are included.
         ii. Override displayRoomDetails() to reflect these details.

 d) Create a class called HotelApp with the main method and perform followings.
         i. Create one object from the StandardRoom class using the default construc
            tor and another object from the LuxurySuite class using the parameterized
            constructor.
         ii. Call both versions of the calculateRoomCost() method on these objects and
             display all room and guest details using the overridden methods.
 */

class Room {
    protected String roomNumber;
    protected String guestName;
    protected int nights;

    public Room() {
        this.roomNumber = "000";
        this.guestName = "Unknown";
        this.nights = 0;
    }

    public Room(String roomNumber, String guestName, int nights) {
        this.roomNumber = roomNumber;
        this.guestName = guestName;
        this.nights = nights;
    }

    public void displayRoomDetails() {
        System.out.println("Room Number: " + roomNumber);
        System.out.println("Guest Name: " + guestName);
        System.out.println("Nights: " + nights);
    }

    public double calculateRoomCost() {
        return nights * 150.00;
    }

    public double calculateRoomCost(int discount) {
        return calculateRoomCost() - (discount * nights);
    }
}

class StandardRoom extends Room {
    private boolean wifiIncluded;

    public StandardRoom() {
        super();
        this.wifiIncluded = false;
    }

    public StandardRoom(String roomNumber, String guestName, int nights, boolean wifiIncluded) {
        super(roomNumber, guestName, nights);
        this.wifiIncluded = wifiIncluded;
    }

    @Override
    public double calculateRoomCost() {
        return nights * 100.00;
    }

    @Override
    public void displayRoomDetails() {
        super.displayRoomDetails();
        System.out.println("Wi-Fi Included: " + (wifiIncluded ? "Yes" : "No"));
        System.out.println("Total Cost: $" + calculateRoomCost());
        System.out.println("Discounted Cost (per night $10 off): $" + calculateRoomCost(10));
    }
}

class LuxurySuite extends Room {
    private boolean extraServicesIncluded;

    public LuxurySuite(String roomNumber, String guestName, int nights, boolean extraServicesIncluded) {
        super(roomNumber, guestName, nights);
        this.extraServicesIncluded = extraServicesIncluded;
    }

    @Override
    public double calculateRoomCost() {
        double baseCost = nights * 200.00;
        if (extraServicesIncluded) {
            baseCost += 75.00;
        }
        return baseCost;
    }

    @Override
    public void displayRoomDetails() {
        super.displayRoomDetails();
        System.out.println("Breakfast & Airport Pickup: " + (extraServicesIncluded ? "Included" : "Not Included"));
        System.out.println("Total Cost: $" + calculateRoomCost());
        System.out.println("Discounted Cost (per night $15 off): $" + calculateRoomCost(15));
    }
}

public class HotelApp {
    public static void main(String[] args) {
        StandardRoom standardRoom = new StandardRoom();
        System.out.println("--- Standard Room ---");
        standardRoom.displayRoomDetails();

        LuxurySuite luxurySuite = new LuxurySuite("305", "Alice Green", 3, true);
        System.out.println("\n--- Luxury Suite ---");
        luxurySuite.displayRoomDetails();
    }
}
