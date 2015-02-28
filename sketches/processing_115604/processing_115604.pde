
/*
Lines around a point
*/


// Starting point coordinates
int x1 = 250;
int y1 = 250;

void setup() {
  size(500, 500);
  background(255);
  stroke(10);
  strokeWeight(10);
  // Draw center point
  point(x1,y1);
  // Set strokeweight for draw()
  strokeWeight(1);
}

void draw() {
  // Increase randomness
  randomSeed(millis());
  // Each draw() draws a line with starting point x1,y1
  // and random end point
  line(x1,y1,random(0,500),random(0,500));
}



