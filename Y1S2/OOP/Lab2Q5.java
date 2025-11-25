/*
Implement a Java program that accepts 5 words from the user and store them in an array.
 Then;
 a. Find and display the longest word from the array.
 b. Calculate and display the total number of characters in all the words combined.
 c. Identify and display the words with an even number of characters.
 */

import java.util.Scanner;

public class Lab2Q5 {
        public static void main(String[] args) {

            Scanner input = new Scanner(System.in);

            String [] words = new String[5];

            System.out.print("Enter 5 words :");

            for(int i=0; i<5; i++) {
                words[i] = input.nextLine();
            }

            System.out.print("Words are :" );
            for(int i=0; i<5; i++){
                System.out.print(words[i] +" ");
            }

            String longest = words[0];

            for(int i=1; i< words.length; i++){
                if(words[i].length() > longest.length())
                    longest = words[i];
            }

            System.out.println();
            System.out.println("Longest word is " +longest);

            int tot_ch = 0;
            for(int i=0; i< 5; i++){
                tot_ch += words[i].length();
            }

            System.out.println("Total numbers of charecters : " +tot_ch );

            System.out.print("Words with even number of characters : ");
            for(int i=0; i< 5; i++){
                if(words[i].length() % 2 ==0){
                    System.out.print(words[i] +" ");
                }
            }

        }
    }


