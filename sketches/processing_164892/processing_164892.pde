
/* @pjs preload="pinkdot.jpg, greencell.jpg"; */

float x = 0.0;
float y = 0.0;
float easing = 0.05;
PImage img;
PImage img2;


void setup() {
  size(500,500);
  smooth();
  noStroke();
}

void draw() {
  
  background(0);
  img = loadImage("burger.jpg");
  img2 = loadImage("eatinglake.jpg");
  float targetX = mouseX;
  float targetY = mouseY;
  x += (targetX - x) * easing;
  y += (targetY - y) *easing;
  fill(153);

  image(img, mouseX, mouseY, 40, 40);
  fill(255);
  image(img2, x, y, 140, 140);
}



