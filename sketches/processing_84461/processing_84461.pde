
/******************************************
 *  Variables
 *    
 *  This sketch outlines the basic variables types
 *  available in processing.
 *  
 *  + boolean - most basic variable: true or false. To be used with conditionals.
 
 *  + int - Integer, number without a decimal point. Integers can be as large as
            2,147,483,647 and as low as -2,147,483,648. They are stored as 32 bits
            of information. 
 
 *  + float - Floating-point number, a number that has a decimal point. Floating-point
              numbers can be as large as 3.40282347E+38 and as low as -3.40282347E+38.
              They are stored as 32 bits (4 bytes) of information.
 *
 *  as we move along in class we will learn when and how to use more variable types.
 *  all of the variable types and their descriptions
 *  can be found in the Processing Reference: http://processing.org/reference/
 *
 *  Matt Richard 01/2013
 ******************************************/

boolean draw_shapes = true;// whether or not to draw the lines and ellipse.

int ellipse_width = 100;
int ellipse_height = 100;

float x_multiplier = 0.33;// change to any number between 0.0-1.0
float x_location;// we will give this variable a value inside of setup

float y_multiplier = 0.33;// change to any number between 0.0-1.0
float y_location;// we will give this variable a value inside of setup

void setup() {
  size(600, 600); //size(width, height); in pixels
  smooth();// anti-aliasing
  
  // determine the x and y location of the drawn elements in the sketch
  // by multiplying the width and height by the respective multipliers
  x_location = width * x_multiplier;
  y_location = height * y_multiplier;
  
  println("x_location = "+ x_location +"  y_location = "+ y_location);
}

void draw() {
  background(128);

  if ( draw_shapes == true ) {
    
    line( x_location, 0, x_location, height );
    line( 0, y_location, width, y_location );
    ellipse( x_location, y_location, ellipse_width, ellipse_height );
    
  }
  
}
