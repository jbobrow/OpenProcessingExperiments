
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
  
  int w = width;
  int h = height;
  
  for (int x = 0; x <= w; x += 20) {
    for (int y = 0; y <= h; y+=20) {
      ellipse(x, y, 1200, 60); 
    }
    
     
  } 

  for(int x = 0; x <= w; x+= 20){
      ellipse(400 + x, 300, 400, 500);
      ellipse (600 + x,800,300,300);
      rect (600,100,-10,300);
  }
    

    /* GO FURTHER
     Create margins by increasing the initial value of x and y. Hint,
     You'll also need to adjust the values on the other side of the math
     operation.
     
     Change the incremental amount for each loop. Try changing both equally,
     then use seperate values for each. 
     */
}

void draw() {
    //int x = 0;
    /*
  for(int x = 0; x<= width; width += 50){
    ellipse(400 + x,300,400,500);
   ellipse(400 + x, 300, 400, 500);
      ellipse (600 + x,800,1200,1900);
      ellipse(400 + x, 300, 400, 500);
      ellipse (600 + x,800,1200,1900);
  }
*/
}




