
/* @pjs preload="lady.png"; */

PImage img;
float opacity = 0;
float angle;
float r = 0;
float g = 0;
float b = 0;

void setup() {
  size(350, 350);
  img = loadImage("lady.png");
}

void draw() {
  background(255);
  opacity = random(215,255);
    b = r*2.5;
    r = random(0,225);
    g = r/b*55;
  angle+=0.035;
  translate(25,25);
  rotate(angle);
  tint(r,g,b, opacity);
  image(img, -65, -75, 500,500);
}


