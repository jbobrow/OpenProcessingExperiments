
/*
  Rotating squares on a moving circle 
 */

// rotation angle
float angle= PI/90;
int move= 120;

void setup() {
  size(900, 500);
}

void draw() {
  //Moving zero-coordinate point
  translate(move, move);
  // rotate the rectangle
  rotate(angle);
  // draw the rectangle
  rect(126, 126, 552, 4);
  // Increase the angle for the next rectangle
  angle++;
  // Move the center the circle
  move++;
}
