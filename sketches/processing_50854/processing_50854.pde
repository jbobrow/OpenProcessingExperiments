
PImage img, img2;

void setup() {
  size(600, 800);
  img = loadImage("josh.jpg");
  img2 = loadImage("sadmoments.jpg");
}

void draw() {
  background(255);
  tint(255);
  image(img, 0, 0);
  tint(100,150,50,150);
  image(img2, 0, 0);
}


