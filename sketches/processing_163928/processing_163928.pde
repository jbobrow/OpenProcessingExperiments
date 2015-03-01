
PImage img;

void setup() {
  img = loadImage("luke.jpg");
  size(1024,768);
}

void draw() {
  image(img, random(0,1024), random(0,768), width/random(2,10), height/random(2,10));
}


