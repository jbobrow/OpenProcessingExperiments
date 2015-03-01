
/*
  Horizontal and vertical lines 
  space stays the same
  line weight increases
  
 */

int a=0;
float strokew=0.25; 
int colour=25;

void setup() {
  size(400,400);
  background(255);
}

void draw() {
  //   Horizontal lines    //  
  stroke(colour, 0, colour);
  strokeWeight(strokew);
  line(0, a, width, a);

  //   Vertical lines    //  
  line(a, 0, a, height);

  //   Variable handling    //
  // Increase space
  a=a+15;
  // Increase weight
  strokew=strokew+0.6;
  // Change colour
  colour=colour+5;
}



