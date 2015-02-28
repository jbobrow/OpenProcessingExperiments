
/*
  Rotating squares on a circle 
 */

// rotation angle
float angle= PI/3.0;

void setup() {
  size(500, 500);
}

void draw() {
  // Fixed zero-coordinate point
  translate(100, 100);
  // rotate the rectangle
  rotate(angle);
  // Increase randomness
  randomSeed(millis());
  // Fill with random colours
  fill(random(255), random(255), random(255));
  // draw the rectangle
  rect(26, 26, 52, 52);
  // Increase the angle for the next rectangle
  angle++;
}



