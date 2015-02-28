
/*
  Horizontal vertical and diagonal lines with increasing weight and space between them
 with transparency
 */

int a=0;
float strokew=0.25; 
int colour=255;

void setup() {
  size(100, 100);
  background(255);
  noSmooth();
}

void draw() {
  //   Horizontal lines    //  
  stroke(colour, 0, colour+30, 100);
  strokeWeight(strokew);
  line(0, a, 100, a);

  //   Diagonal lines    //
  // Only for the first 100 iterations of draw  
  if (a<100) {
    stroke(255, 255, 0, 800);
    line(90-a, 100, 100, 90-a);
  }

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



