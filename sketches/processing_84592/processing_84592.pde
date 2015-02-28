
PImage img;

void setup() {
  size (800, 800);
  img = loadImage ("flag.jpg");
}

void draw () {
  image (img, mouseX-img.width/2, mouseY);
}


