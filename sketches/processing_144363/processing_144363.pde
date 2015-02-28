
void setup() {
  size(960,720);
  PImage img;
img = loadImage("delissia.jpg");
image(img, 0, 0);
}

void draw() {
  if (mousePressed) {
    PImage img;
img = loadImage("delissia.jpg");
image(img, 0, 0);
    
  }
   PImage img;
img = loadImage("paidefamilia.png");
image(img, mouseX-50, mouseY-50);
}



