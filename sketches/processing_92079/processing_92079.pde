
PImage img;

void setup() {
  // Images must be in the "data" directory to load correctly
  img = loadImage("http://www.barrylindleyart.com/Selected sketches/images/peatclump.jpg");
}

void draw() {
  image(img, 0, 0);
}

PImage img;

void setup() {
  // Images must be in the "data" directory to load correctly
  img = loadImage("http://www.barrylindleyart.com/Selected sketches/images/peatclump.jpg");
}

void draw() {
  image(img, 0, 0);
  image(img, 0, 0, width/2, height/2);
}
