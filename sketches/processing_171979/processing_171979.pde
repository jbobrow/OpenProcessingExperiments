
/* @pjs preload="skull.jpg"; */

float angle =0.0;
float speed=0.05;

void setup() {
  size(800, 600);
  noStroke();
  smooth();
}

void draw() {
  background(255);
  PImage img;
  img=loadImage("skull.jpg");
  image(img, 170, 50);
  circlePhase(0.0);
  circlePhase(QUARTER_PI);
  circlePhase(HALF_PI);
  angle += speed;
}

void circlePhase(float phase) {
  float diameter=45+(sin(angle+phase)*25);
  fill(random(250),random(250),random(250));
  ellipse(290, 280, diameter, diameter);
  ellipse(400, 280, diameter, diameter);
}



