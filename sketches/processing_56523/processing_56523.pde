
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;

float easing = 0.05;
float offset = 0;

void setup() {
  size(720,480);
  img1 = loadImage ("01.png");
  img2 = loadImage ("02.png");
  img3 = loadImage ("03.png");
  img4 = loadImage ("04.png");
  img5 = loadImage ("alpine.png");
}

void draw () {
  background (img5);
  float targetOffset = map(mouseY, 0, height, -40, 40);
  offset += (targetOffset - offset) * easing;
  
  image (img4, 85 + offset, 100);
  
  float smallerOffset = offset * 0.7;
  image (img3, 510 + smallerOffset, 180, 118, 145);
  
  smallerOffset *= -0.5;
  image (img1, 350 + smallerOffset, 210, 56, 88);
}

