
// Learning Processing Exercise 15-1. Displaying an image.

float theta = 0.0;

PImage hoff;

void setup() {
  size(400, 400, P3D);
  hoff = loadImage("hoff.jpg");
}

void draw() {
  background(33);
  theta += 0.01;
  translate(width / 2, height / 2);
  rotateX(theta);
  imageMode(CENTER);
  image(hoff, 0, 0, 200, 200);
}


