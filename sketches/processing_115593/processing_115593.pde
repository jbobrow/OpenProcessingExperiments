
/*
  Horizontal lines with increasing weight and space between them
 */

int a=0;
float strokew=0.25; 

void setup() {
  background(255);
  //aliased edges
  noSmooth();
}

void draw() {

  //   Horizontal lines    //  
  stroke(134);
  strokeWeight(strokew);
  line(0, a, 100, a);

  //   Variable handling    //
  // Increase space
  a=a+5;
  // Increase weight
  strokew=strokew+0.25;
}



