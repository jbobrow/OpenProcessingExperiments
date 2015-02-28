
PImage img;
boolean once = true;

void setup() {
  size(480, 640);
  img = loadImage("mysummervacation.jpg");
  img.resize(480, 640);
  background(0);
  frameRate(200);
}

void draw() {
  if (once) {
    img.loadPixels();
    once = false;
  }
  loadPixels();
  int x1 = int(random(0, width));
  int y1 = int(random(0, height));
  int offset = 10;

  for (int x3 = x1-offset; x3 < x1+offset; x3++) {
    for (int y3 = y1-offset; y3 < y1+offset; y3++) {
      int loc = x3 + y3*width;
      loc = constrain(loc, 0, width*height-1);

      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);
      pixels[loc] = color(r, g, b);
    }
  }
  updatePixels();
}


