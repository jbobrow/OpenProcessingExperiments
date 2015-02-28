
// Mechanical Motion
// from http://web.arch.usyd.edu.au/~rob/teaching/2010/DECO1012/lectures/DECO1012-Lecture-08.pdf

float angle = 0.0; // Current angle
float speed = 0.05; // Speed of motion
float radius = 100.0; // Range of motion

void setup() {
  size(250, 250);
  noStroke();
  smooth();
}
void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  angle += speed;
  float sinval = sin(angle);
  float yoffset = sinval * radius;
  ellipse(width /2, 50 + yoffset, 80, 80);
}

