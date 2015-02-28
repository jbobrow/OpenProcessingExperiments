
PImage img;

void setup() {
  size (600, 400);
  img = loadImage ("space.jpg");
}

void draw() {
  image(img, 0, 0, width, height);
}



