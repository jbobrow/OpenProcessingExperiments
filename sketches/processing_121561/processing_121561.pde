
// Learning Processing Exercise 15-7. Using an image's pixels to draw pixels.

PImage hoff;

void setup() {
  hoff = loadImage("hoff.jpg");
  size(hoff.width, hoff.height);
}

void draw() {
  loadPixels();
  hoff.loadPixels();
  for (int y = 0; y < height; ++y) {
    for (int x = 0; x < width; ++x) {
      int loc = x + y * width;
      float r = red(hoff.pixels[loc]);
      float g = green(hoff.pixels[loc]);
      float b = blue(hoff.pixels[loc]);
      pixels[loc] = color(random(0, r), random(0, g), random(0, b));
    }
  }
  updatePixels();
}


