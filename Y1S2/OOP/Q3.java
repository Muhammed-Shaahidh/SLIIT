/*
You have been hired as a software developer by a company to build a system that helps
 manage employee performance evaluations and salary bonuses. At the end of each
 year, the company assesses each employee’s performance and awards a bonus based on
 their performance rating. The bonus is calculated as a percentage of the employee’s
 basic salary, with higher performance ratings leading to higher bonuses.

 As part of this system, you need to design a class to represent an employee and ensure
 that the employee’s details and performance evaluations are handled securely.
 The system should allow for proper salary calculations based on performance, while
 also ensuring that performance ratings are within a valid range (1 to 5). You
 should also display the final salary after adding the bonus.

 The company gives a bonus based on the employee’s performance rating, as shown
 below:
                Performance Rating          Bonus Percentage
                        5                   20% of Basic Salary
                        4                   15% of Basic Salary
                        3                   10% of Basic Salary
                        2                    5% of Basic Salary
                        1                    No Bonus (0%)

You are required to implement:
    • calculateBonus() method– to calculate the bonus amount based on the performance
    rating using the policy above.
    • calculateTotalSalary() method– to calculate the total salary as:

                        Total Salary = Basic Salary + Bonus
 */


import java.util.Scanner;
public class Q3 {
        private String EmployeeName;
        private int EmployeeID;
        private double BasicSalary;
        private int rating;

        public Q3(int EmployeeID, String EmployeeName, double BasicSalary, int rating ){

            this.EmployeeID = EmployeeID;
            this.EmployeeName = EmployeeName;
            this.BasicSalary = BasicSalary;
            this.rating = rating;
        }
        public double Bonus(){
            double percentage = 0;
            switch(rating) {
                case 5:
                    percentage = 0.20;
                    break;
                case 4:
                    percentage = 0.15;
                    break;
                case 3:
                    percentage = 0.10;
                    break;
                case 2:
                    percentage = 0.05;
                    break;
                case 1:
                    percentage = 0;
                    break;
                default:
                    System.out.println("Invalid Performance Rating..(Please enter a number between 1-5)");
            }
            return BasicSalary * percentage;
        }
        public double TotalSalary(){
            return BasicSalary + Bonus();
        }
    public static void main(String [] args){
            Scanner input = new Scanner(System.in);

            System.out.print("Employee ID: ");
            int ID = input.nextInt();

            System.out.print("Employee Name: ");
            String Name = input.next();

            System.out.print("Employee Salary: ");
            double Salary = input.nextDouble();

            System.out.print("Employee Performance Rating (1-5): ");
            int rating = input.nextInt();

            Q3 employee= new Q3(ID,Name,Salary,rating);

            System.out.println("\nEmployee Details: : ");

            System.out.println("Employee ID: " + ID);
            System.out.println("Employee Name: " + Name);
            System.out.println("Employee Salary: " + Salary);
            System.out.println("Employee Rating: " + rating);
            System.out.println("Bonus: "+employee.Bonus());
            System.out.println("Total Salary: "+employee.TotalSalary());

    }



    }


