/*
 Create a class called “Calculator” and implement three Java methods to perform the
 following operations.
 • add()– add two integers pass as parameters and return the result
 • multiply()– multiply two integers pass as parameters and return the result
 • square()– receive an integer as a parameter and return the result after multiplying
 the number by itself.

 Use the above methods in the Main Method to calculate the result of the following
 mathematical expressions:
        1. (3 ∗4+5∗7)²
        2. (4 +7)² +(8+3)²
 */

public class Lab1_Q5 {
    public static int add(double a, double b){
       return (int) (a+b);
    }
    public static int multiply(int a, int b){
        return a*b;
    }
    public static double sq(int a){
        return Math.pow(a, 2);
    }

    public static void main(String[] args) {

        double Ans1 = sq(add(multiply( 3,4),multiply(5, 7)));
        double Ans2 = add(sq(add(4,7)), sq(add(8,3)));

        System.out.println("Answer 01 :" +Ans1);
        System.out.println("Answer 02 :" +Ans2);
    }
}
