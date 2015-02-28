
/*
  Horizontal and vertical lines with increasing weight and space between them
 with transparency
 */

int a=0;
float strokew=0.25; 
int colour=255;

void setup() {
  background(255);
  noSmooth();
}

void draw() {
  //   Horizontal lines    //  
  stroke(colour, 0, colour+30);
  strokeWeight(strokew);
  line(0, a, 100, a);

  //   Vertical lines    //
  // Color and transparency
  stroke(255, 255, 255, 200);
  line(a, 0, a, 100);

  //   Variable handling    //
  // Increase space
  a=a+5;
  // Increase weight
  strokew=strokew+0.25;
  // Change colour
  colour=colour-10;
}



