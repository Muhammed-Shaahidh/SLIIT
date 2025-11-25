/*
You have been hired by a Ride-Sharing Company to develop a Driver Performance
 Management System that tracks driver details, calculates earnings, and rewards per
formance- based bonuses. Each month, drivers receive a performance score (1 to 5) based
 on customer ratings, with higher scores leading to higher bonus percentages of their base
 salary.

 The bonus policy is as follows:

                Performance Score           Bonus Percentage
                        5                   25% of Base Salary
                        4                   20% of Base Salary
                        3                   15% of Base Salary
                        2                   10% of Base Salary
                        1                    No Bonus (0%)

 a) Implement a class called Driver that includes four attributes: driverID, driver
Name, baseSalary, and performanceScore.

 b) The class should support constructor overloading, allowing different ways to initial
ize a Driver object. There should be three constructors:
 • one that accepts only driverID and driverName
 • another that includes only the baseSalary
 • third that initializes all four attributes, including performanceScore.

 c) Implement getters and setters for driverID and performanceScore. The setter for
 performanceScore must validate that the value is between 1 and 5. If an invalid
 score is provided, it should default to 1.

 d) Create two versions of the calculateBonus() method:
 • one that calculates the bonus based on the driver’s actual performance score
 (attribute)
 • another that allows a custom score (parameter) to be used without modifying
 the stored value.

 e) Additionally, implement a calculateTotalSalary() method to compute the final salary
 by adding the base salary and the calculated bonus.
 
 f) Implement a main method and create Driver objects to demonstrate the above
 variations of constructors. Then call the appropriate methods to calculate the
 salaries and display all the details of each driver.
 */

public class Driver {
    private String driverID;
    private String driverName;
    private double baseSalary;
    private int performanceScore;

    public Driver( String driverID){
        this.driverID =driverID;
        this.driverName = driverName;
    }

    public Driver( double baseSalary){
        this.baseSalary = baseSalary;
    }

    public Driver(String driverID, String driverName, double baseSalary, int performanceScore){
        this.driverID = driverID;
        this.driverName = driverName;
        this.baseSalary = baseSalary;
        this.performanceScore = performanceScore;
    }

    public String getDriverID() {
        return driverID;
    }

    public void setDriverID(String driverID) {
        this.driverID = driverID;
    }

    public int getPerformanceScore() {
        return performanceScore;
    }

    public void setPerformanceScore(int performanceScore) {
       if(performanceScore >= 1 && performanceScore <= 5){
           this.performanceScore = performanceScore;
       }
       else{
           this.performanceScore = 1;
       }
    }
    public double calculateBonus() {
        return calculateBonus(this.performanceScore);
    }

    public double calculateBonus(int performanceScore) {
        double bonusPercent;
        switch(performanceScore){
            case 5: bonusPercent = 0.25;
            break;

            case 4: bonusPercent = 0.20;
            break;

            case 3: bonusPercent = 0.15;
            break;

            case 2: bonusPercent = 0.10;
            break;

            default: bonusPercent = 0.00;
        }
        return baseSalary * bonusPercent ;
    }

    public  double calculateTotalSalary(){
        return baseSalary + calculateBonus();
    }

    public String getDriverInfo(){
        return "Driver ID :" +this.driverID +" \nDriver Name :" +this.driverName +"\nBase Salary :" +this.baseSalary+"\nPerformance Score :" +this.performanceScore +"\nBonus :" +calculateBonus() +"\nTotal Salary :" +calculateTotalSalary();
    }

    public static void main(String[] args) {

        Driver driver1 = new Driver("D1001" , "John Smith", 4000, 5);
        Driver driver2 = new Driver("D1002", "Emily Davis", 3500, 3);
        Driver driver3 = new Driver("D1003", "Michael Johnson", 5000, 1);

        System.out.println(driver1.getDriverInfo());
        System.out.println();
        System.out.println(driver2.getDriverInfo());
        System.out.println();
        System.out.println(driver3.getDriverInfo());
        System.out.println();

        System.out.println("Bonus for driver3 with custom rating 4: " +driver3.calculateBonus(4));
    }
}