
/*to define a variable, first you specify what TYPE of value it contains.
Common types are: int (integer number), float (floating point number), string
(text) and boolean (true / false)
Then, you come up with a NAME for that variable. The name should not contain
spaces or special characters, it should not start with a number. Normally
we use camel case to write that name - "join" the different words of the name
together, highlighting a new word by capitalizing the first letter. Variable 
names usually start with lower case - we reserve upper case for Classes 
(and all-caps for constants).
To define a value of a variable, we use "=", meaning "set to"
*/
int petriDateOfBirth = 1985;
int currentYear = 2014;
int petriAge = currentYear-petriDateOfBirth;
//strings are enclose within double quotes
String myText = "age is ";
//println shows a variable or another value on the console (black area below)
//when you're using strings, even with numbers, + joins pieces of text
//together (this is called concatenation)
println("Petri's "+myText+petriAge);
int mariDateOfBirth = 1988;
int mariAge = currentYear-mariDateOfBirth;
println("Mari's "+myText+mariAge);


