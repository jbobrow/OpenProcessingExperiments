
/* CHAD HALL - EXERCISE 2:
Create a 400x400 pixel composition using repetition and variation. 
Strive to create a visually interesting image.
Make sure to consider Color & Composition.
*/

size (400, 400); //set canvas size
smooth();
background(255); //establish white background


int x1, y1, x2, y2, x3, y3; //set default initial triangle placement values
x1 = 0;
y1 = 0;
x2 = 0;
y2 = 0;
x3 = 0;
y3 = 0;


/*  SET DEFAULT COLOR  */
colorMode ( HSB ); //set color mode to HSB
float h, s, b, a; //Use 'float' instead of 'int' because some variables will be random
h = 30; //default hue value
s = 255; //default saturation value
b = 255; //default brightness value
a = 60; //default alpha value


/* ADD REPEATING DIAGONAL LINE BACKGROUND */
stroke(a, 0, 240, 255); //set stroke color
strokeWeight(1); //set stroke weight
for(int j = -400; j<400; j = j+4){ //begin loop
  line(j, 0, j+400, 400); //draw line
} //end loop


/* REMOVE STROKE FOR SHAPES */
noStroke(); //remove stroke


/* LOOP TO GENERATE TRIANGLE PATTERN */  
for( int i = x1; i <= width; i = i + 10 ) { //begin loop

  //generate random color values
  b = random(20, 255);
  h = random(120, 140);
  a = random(1,60);
  fill(h, s, b, a); //set fill color
  
  //generate random points to integrate into triangle points
  float z = random(0, 400); 
  float r = random(0, 400);
  float k = random(0, 400);
  
  triangle(i, y1+z, i+r, y2+k, x3+z, y3-k); //draw the triangle
  
} //end loop


/* DRAW STATIONARY CIRCLES */

a = random(30,100); //set random (but, more constrained) transparency/alpha value

fill(h, s, b, a); //color fill
ellipse(50, 350, 50, 50); //draw lower-left circle

fill(h, s, b, 200); //color fill
ellipse(350, 50, 150, 150); //draw upper-right circle


/* DRAW MOVING CIRCLE */

// generate random red/orange hue
b = random(200,255);
h = random(0, 30);
fill(h, s, b, 150); //color fill

//draw circle
float circlex = random(300, 380); //generate random, but constrained x placement value
float circley = random(250, 340); //generate random, but constrained y placement value
ellipse(circlex, circley, 20, 20); // draw circle


