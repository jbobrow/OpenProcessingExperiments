
/*
  Rotating squares on a moving circle 
 */

// rotation angle
float angle= PI/4.0;
int move= 100;
int recta= 25;

void setup() {
  size(500, 500);
  background(255);
}

void draw() {
  //Moving zero-coordinate point
  translate(move, move);
  // rotate the rectangle
  rotate(angle);
  // draw the rectangle
  stroke(255);
  fill(176, 224, 230);
  rect(25, 25, recta*0.2, recta*0.2);
  // Increase the angle for the next rectangle
  angle++;
  // Move the center the circle
  move++;
  // increase the size of the rect
  recta++;
}



