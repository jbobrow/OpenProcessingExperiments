
/*
  Horizontal vertical and diagonal lines with increasing weight and space between them
 with transparency
 */

int a=0;
float strokew=0.3; 
int colour=255;

void setup() {
  size(100, 100);
  background(0);
  noSmooth();
}

void draw() {
  //   Horizontal lines    //  
  stroke(0, 100, 0, 100);
  strokeWeight(strokew);
  line(0, a+1, 100, a+1);

  //   Diagonal lines    //
  // Only for the first 100 iterations of draw  
  if (a<100) {
    stroke(255, 215, 0, 100);
    line(90-a, 100, 100, 90-a);
  }

  //   Vertical lines    //
  // Color and transparency
  stroke(colour, colour, colour, 100);
  line(a, 0, a, 100);

  //   Variable handling    //
  // Increase space
  a=a+3;
  // Increase weight
  strokew=strokew+0.3;
  // Change colour
  colour=colour-10;
}



