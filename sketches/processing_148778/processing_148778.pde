
/*
This script enlights a fundamental and regrettably badly 
known difference of the equal operator in Java programming:

For the base types, such as int, float, boolean and String 
(very strange, because String is an object, not a base type): 
'=' involves a memory copy

For any other object, '=' creates a reference to the object, 
meaning it does not duplicate it in the memory!
*/

class Obj {
  public String name;
  public Obj( String name ) {
    this.name = name;
  }
}

String str1;
String str2;
Obj o1;
Obj o2;

void setup() {
  
  size( 150,100 );
  
  // PASS BY VALUE
  // creation of a new string
  str1 = new String( "Yo" );
  // copy of the first string in the second
  str2 = str1;
  // modification of the first string
  str1 = "Hello";
  // result:
  println( "str1: " + str1 );
  println( "str2: " + str2 );
  
  // PASS BY REFERENCE
  // creation of a new object
  o1 = new Obj( "Yo" );
  // copy of the first object in the second
  o2 = o1;
  // modification of one of the parameters of the first object
  o1.name = "Hello";
  // result:
  println( "o1.name: " + o1.name );
  println( "o2.name: " + o2.name );
  
}

void draw() {
  
  background( 0 );
  fill( 255 );
  text( "str1: " + str1, 10, 25 );
  text( "str2: " + str2, 10, 40 );
  text( "o1.name: " + o1.name, 10, 55 );
  text( "o2.name: " + o2.name, 10, 70 );
  
}


