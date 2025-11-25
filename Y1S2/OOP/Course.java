/*
 Develop a Student-Course Registration System where a Student class maintains references
 to courses they have enrolled in, but the Course class does not store any reference to the
 student. The Course class represents a university course. It contains two attributes:
 courseCode and courseTitle, both of type String. The class includes a parameterized
 constructor to initialize these attributes upon object creation. It also provides a method
 called displayCourseDetails() which prints the course code and title to the console. The
 Student class models a student who can enroll in up to three courses. It includes attributes
 studentID and studentName to store personal information. It maintains a fixed-size ar
ray of type Course[] to keep track of enrolled courses (with a size of 3), along with an
 integer variable to track the number of currently enrolled courses. The class features
 a default constructor, a parameterized constructor to initialize the student’s details, a
 method enrollCourse(Course course) to add a course into the array, and a displayStu
dentDetails() method to print student information and all enrolled course details using
 the displayCourseDetails() method from the Course class. In the main method, create
 three Course objects with unique codes and titles. Then create a Student object using
 the parameterized constructor. Use the enrollCourse() method to enroll the student in
 all three courses. Finally, call displayStudentDetails() to print the student’s information
 along with the details of all the enrolled courses.

 A guide to implement the above scenario:

 Step 1- Create the Course Class
         • Define a class named Course with two private attributes courseCode (String),
         courseTitle (String)
         • Add a parameterized constructor to initialize both values.
         • Add a method displayCourseDetails() to print course code and title.

 Step 2: Create the Student Class
         • Define a Student class with the studentID (String), studentName (String) and cour
        seCount (int) as attributes.
         • Create an array of Course objects as below to hold max 3 courses.
         Course[ ] courses = new Course[3];
         • Add default and parameterized constructors
         • Add a method enrollCourse(Course c) to add a course to the array. Add course
         only if courseCount ¡ 3.
         • Add a method displayStudentDetails() to print student information Use a loop
         through the array and call displayCourseDetails() for each course object.

 Step 3: Implement the Main Class
         • Create a class named StudentCourseApp with the main() method
         • Create at least 3 Course objects with different details.
         • Create 1 Student object using the parameterized constructor.
         • Use enrollCourse() to enroll the student in all 3 courses.
         • Finally, call displayStudentDetails() to show the output.
 */

public class Course {
    private String courseCode;
    private String courseTitle;

    public Course(String courseCode, String courseTitle){
        this.courseCode = courseCode;
        this.courseTitle = courseTitle;
    }
    public String displayCourseDetails(){
        return "Course Code: " +courseCode +"\nCourse Title: " +courseTitle +"\n";
    }
}

class Student{
    private String studentID;
    private String studentName;
    private Course [] course = new Course[3];
    private int courseCount;

    public Student(){
        this.studentID = "";
        this.studentName = "";
        this.courseCount = 0;
        this.course = new Course[3];
    }

    public Student(String studentID, String studentName, int courseCount){
        this.studentID = studentID;
        this.studentName = studentName;
        this.courseCount = 0;
        this.course = new Course[3];
    }

    public void enrollCourse(Course course){
        if(courseCount < 3){
            this.course[courseCount] = course;
            courseCount++;
        }
        else{
            System.out.println("Can't enroll, Course count is more than 3");
        }
    }

    public void displayStudentDetails(){
        System.out.println("Student ID: " +studentID);
        System.out.println("Student Name: " +studentName);
        System.out.println("Course Count: " +courseCount);
        System.out.println();
        System.out.println("Enrolled Course(s): " );
        System.out.println();
        for(int i=0; i<courseCount; i++){
            System.out.println(course[i].displayCourseDetails());
        }
    }
}

class StudentCourseApp{
    public static void main(String[] args) {

        Course c1 = new Course("1587", "DSA");
        Course c2 = new Course("5210", "OOP");
        Course c3 = new Course("3150", "IP");

        Student s1 = new Student("IT2451", "Alex", 2);

        s1.enrollCourse(c1);
        s1.enrollCourse(c2);
        s1.enrollCourse(c3);

        s1.displayStudentDetails();
    }
}
