
PImage img;

void setup() {
  size(500,375);
  img = loadImage("Akihiko.jpg");
}

void draw() {
  image(img, 0, 0, width, height);
}


