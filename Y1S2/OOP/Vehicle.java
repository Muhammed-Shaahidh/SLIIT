/*
Implement a Vehicle Speed Calculation System that computes the speed of different
 types of vehicles. The system should support cars and bicycles, both of which are specific
 types of vehicles.
 • ACar has an engine capacity (CC) and a top speed (km/h).
 • ABicycle has a gear count and a maximum pedaling speed (km/h).

 a) Create a class called Vehicle with the attribute vehicleName (String). Implement a
 method displayVehicleDetails() to print the vehicle name.

 b) Implement method overloading in the Vehicle class by defining calculateSpeed()
 with no parameters to return 0.0 as the default speed and an overloaded method
 calculateSpeed(double factor), which scales the speed by multiplying the default
 speed with the given factor.

 c) Create a subclass called Car that inherits from Vehicle. Add two additional at
tributes: engineCapacity (int) and topSpeed (double). Override the calculate
Speed() method to return the car’s top speed, and override the displayVehicleDe
tails() method to include the speed and engine capacity.

 d) Create another subclass called Bicycle that inherits from Vehicle. Add two addi
tional attributes: gearCount (int) and maxPedalSpeed (double). Override the cal
culateSpeed() method to return the bicycle’s maximum pedaling speed, and override
 the displayVehicleDetails() method to include the speed and gear count.
 
 e) Implement the main() method to create one object from Car using the default
 constructor and one object from Bicycle using the parameterized constructor. Call
 both overloaded versions of calculateSpeed() for the objects and display all vehicle
 details using the overridden displayVehicleDetails() method.
 */

public class Vehicle {
    protected String model;
    protected double rentalPricePerDay;

    public Vehicle(String model, double rentalPricePerDay){
        this.model = model;
        this.rentalPricePerDay = rentalPricePerDay;
    }

    public double calculateRentalCost(int days){
        return days * rentalPricePerDay;
    }
}

class Car extends Vehicle{

    private int numSeat;

    public Car(String model, double rentalPricePerDay, int numSeat){
        super(model, rentalPricePerDay);
        this.numSeat = numSeat;
    }
}

class MotorCycle extends Vehicle{

    private int engineCapacity;

    public MotorCycle(String model, double rentalPricePerDay, int engineCapacity){
        super(model, rentalPricePerDay);
        this.engineCapacity = engineCapacity;
    }
}

class rentalCost{
    public static void main(String[] args) {

        Car car = new Car("Civic",8000.0,5);
        MotorCycle moto =new MotorCycle("Pulsar",1500.0,150);

        System.out.println("Total Cost for Car: " +car.calculateRentalCost(5));
        System.out.println("Total Cost for MotorCycle: " +moto.calculateRentalCost(10));
    }
}
