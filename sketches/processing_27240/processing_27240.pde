
// Periodic Motion
// from: http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-08.pdf
// by Rob Saunders

float angle = 0.0; // Current angle
float speed = 0.1; // Speed of motion
float radius = 30.0; // Range of motion
float sx = 3.0;
float sy = 1.0;

// sx = 1.0 sy = 0.5
// sx = 1.0 sy = 3.0
// sx = 1.0 sy = 2.0

void setup() {
  size(250, 250);
  noStroke();
  smooth();
}

void draw() {
  fill(0, 4);
  rect(0, 0, width, height);
  angle += speed; // Update the angle
  float sinval = sin(angle);
  float cosval = cos(angle);

  // Set the position of the small circle based on new
  // values from sine and cosine
  float x = 100 + (cosval * radius) * 2;
  float y = 100 + (sinval * radius) * 2;
  fill(255);
  ellipse(x, y, 2, 2); // Draw smaller circle
  
  // Set the position of the large circles based on the
  // new position of the small circle
  float x2 = x + cos(angle * sx) * radius ;
  float y2 = y + sin(angle * sy) * radius ;
  ellipse(x2, y2, 6, 6); // Draw larger circle
}

void mouseClicked() {
  sx = random(3);
  sy = random(3);
}
