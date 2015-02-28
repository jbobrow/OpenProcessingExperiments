
PImage img0;
PImage img1;
float  w, h;
float x, y;

void setup() {
  size(300, 300);
  img0 = loadImage("edward.png");
  img1 = loadImage("blade.png");
}

void draw() {
  background (#000000);
  image(img1, -200, -100, x-100, y-100);
  image(img0, -30, -30, w, h);
  
  w += 2;
  h += 2;
  x += 1;
  y += 1;
}


