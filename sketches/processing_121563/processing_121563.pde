
// Learning Processing Exercise 15-8. Adjusting brightness according to the mouse position.

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
      float distance = dist(x, y, mouseX, mouseY);
      float brightness = (100 - distance) / 100;
      r = constrain(r * brightness, 0, 255);
      g = constrain(g * brightness, 0, 255);
      b = constrain(b * brightness, 0, 255);
      pixels[loc] = color(r, g, b);
    }
  }
  updatePixels();
}


