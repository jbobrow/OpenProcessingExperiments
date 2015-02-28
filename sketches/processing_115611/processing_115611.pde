
/*
  Moving rotating square
 */

// rotation angle
float angle= PI/3.0;
int move= 100;

void setup() {
  size(500, 500);
  // Decrease framerate for better visual outcome
  frameRate(10);
}

void draw() {
  // Draw only the current square
  background(255);
  //Moving zero-coordinate point
  translate(move, move);
  // rotate the rectangle
  rotate(angle);
  // draw the rectangle
  rect(26, 26, 52, 52);
  // Increase the angle for the next rectangle
  angle++;
  // Move the center the circle
  move++;
}



