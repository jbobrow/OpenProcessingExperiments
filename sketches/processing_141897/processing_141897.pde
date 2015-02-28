
/*
  Rotating squares all over, with random transparency
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
  // Increase randomness
  randomSeed(millis());
  //Moving zero-coordinate point
  translate(random(500),random(500));
  // rotate the rectangle
  rotate(angle);
  // Fill with random colours and random transparency
  fill(random(255), random(255), random(255),random(1000));
  // draw the rectangle
  rect(26, 26, 52, 52);
  // Increase the angle for the next rectangle
  angle++;
}



