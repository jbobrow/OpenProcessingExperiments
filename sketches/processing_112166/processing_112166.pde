
/*
Using two loops to draw a grid of shapes.
 
 This sketch references code available in "Form + Code."
 * Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 */

void setup() {
  size( 800, 600 );
  smooth();
  noFill();
  
  background( 255 );

  // draw a grid of overlapping circles
  // for every x-increment, draw a column of circles in the y-direction.
  // notice we don't have to use global variables for this because we are using an increment
  // of 20 to decide the x/y starting positions.   
  
  for (int x = 0; x <= width; x += 20) {
    for (int y = 0; y <= height; y+=20) {
      rect(x, y, 10, 10);
    }
  } 


}

void draw() {

     
     
   for (int x = mouseX; x <= width; x += 10) {
    for (int y = mouseY; y <= height; y+=10) 
      rect(x, y, 10, 10);
      //change size of box being drawn with

   
        //if (mousePressed == true) {
        //fill(random(0, 120), random(0, 120), random(0, 220);
       // } else {
         
     fill(random(0, 220), random(0, 120), random(0, 120));
   }
   
   }
