
/**
 This is an example of using a while loop.
 
 The goal was to draw a row of balls across the top of the canvas
 without going past the right edge. We use a while loop to keep
 drawing balls until ew reach one that won't fit.
 
 C. Andrews
 2014-01-08
 **/

int diameter = 70;
int x = diameter/2;

void setup() {
  size(600, 600);
  fill(100, 255, 0);
  background(255);
  noLoop(); // turn off the frame loop
}


void draw() {

  // this will keep going until x gets too close to the right wall
  while (x <= width - diameter/2) {

    int y = diameter / 2; 
    ellipse(x, y, diameter, diameter);
    x = x + diameter;
  }
}



