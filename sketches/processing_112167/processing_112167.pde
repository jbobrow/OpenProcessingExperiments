
/*
Using two loops to draw a grid of shapes.
 
 This sketch references code available in "Form + Code."
 * Form+Code in Design, Art, and Architecture 
 * by Casey Reas, Chandler McWilliams, and LUST
 * Princeton Architectural Press, 2010
 * ISBN 9781568989372
 */

void setup() {
  size( 1000, 1000 );
  smooth();
  noFill();
  
  background( 235 );

  // draw a grid of overlapping circles
  // for every x-increment, draw a column of circles in the y-direction.
  // notice we don't have to use global variables for this because we are using an increment
  // of 20 to decide the x/y starting positions.   
  
  for (int x = 0; x <= width; x += 20) {
    for (int y = 0; y <= height; y+=20) {
      rect(x, y, 10, 10);
      fill(245, 82, 0);
    }
  } 

  
}

void draw() {
fill(random(0, 200), random(0, 250), random(0,100));
     
     
   for (int x = mouseX; x <= width; x += 40) {
    //for (int y = mouseY; y <= height; y+=40) 
      ellipse(mouseX, mouseY, 60, 60);
     //greens come in on right edge?
     //leave tracers flashing rather than solid fill?
     //how to erase if keyPressed?
    
         
     fill(random(0), random(0), random(90,255));
   }
   
   }
