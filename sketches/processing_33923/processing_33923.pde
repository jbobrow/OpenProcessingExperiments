
/*
This bit of code reviews variables, and gives you tips on how different 
data types handle other data types. Example int -> float, etc...

Also try leaving a variable unassigned. This throws a unique error that you 
will undoubtabley run across in your programming life.
*/

// ------------------------------------------------------int example

int example_int;
//This line is normal
//example_int = -72;
// This line will throw an error. 
//example_int = 4.332;
// This line will not throw an error and will chop off any decimal places.
example_int = int(4.999);
//It is often handy to convert from a float to an int

println("the integer 'example_int' = " + example_int);

// ------------------------------------------------------float example

float example_float;
//This line of code is valid, but why use a float if you need an int?
example_float = 3;
//this is a normal float declaration
//example_float = 7.4;

//notice how floats add a ".0" onto the end of whole numbers
println("the float 'example_float' = " + example_float);

// ------------------------------------------------------Boolean example

Boolean example_bool;
//Any of next three lines of code throw an error:
//example_bool = 1;
//example_bool = 0;
//example_bool = 84.215
//These two lines of code work:
example_bool = boolean(-23); // This only works for integers. Only 0 = false
//example_bool = false; //or true, of course
println("the Boolean 'example_bool' = " + example_bool);

// ------------------------------------------------------String example

String example_string;

//This line is valid:
example_string = "Hello World!";

//This throws an error:
//example_string = 3;

//To convert to a String:
//example_string = str(3);
//or
//example_string = str(30.45);

//WATCH YOUR QUOTATIONS! This line throws an error:
//example_string = 'Hello World!';
//Single quotes mean something totally different to a computer. 
//Single quotes denote a char data type. Don't worry about it yet. 

println("the String 'example_string' = " + example_string);
