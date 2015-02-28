
/*
  Horizontal and vertical lines with increasing weight and space between them
 */

int a=0;
float strokew=0.2; 
int colour=255;

void setup() {
  background(255);
}

void draw() {
  //   Horizontal lines 
  stroke(200, 100, colour+60);
  strokeWeight(strokew);
  line(0, a, 100, a);

  //   Vertical lines    //  
  line(a, 0, a, 100);

  //   Variable handling    //
  // Increase space, changing distance
  a=a+8;
  // Increase weight
  strokew=strokew+0.2;
  // Change colour
  colour=colour-20;
}



