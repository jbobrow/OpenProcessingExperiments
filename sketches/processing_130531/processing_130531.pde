
/**
 Here is the same approach to drawing the sine wave, but now, we are
 "modulating" it with a nother sine wave with a different frequency.
 This creates more complicated curves.
 
 C. Andrews
 2014-01-27
 **/


int numPoints = 300;

void setup() {
  size(600, 600); 
  noFill();
}


void draw() {
  background(255);

  translate(0, height/2);

  float x = 0;
  float y = 0;
  float angle = width/numPoints;
  beginShape();
  for (int i = 0; i < numPoints; i++) {
    x = angle*i;
    y = sin(x/60)* 100 *sin(x/5);
    vertex(x, y);
  }
  endShape();
}



