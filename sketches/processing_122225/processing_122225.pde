
// Learning Processing Exercise 15-11. Creating a pixel "filter" that uses two images.

PImage hoff;
PImage skull;

final int LENS_SIZE = 80;

void setup() {
  hoff = loadImage("hoff.jpg");
  skull = loadImage("skull.jpg");
  size(hoff.width, hoff.height);
  println(width);
}

void draw() {
  image(hoff, 0, 0);
  int xStart = constrain(mouseX - LENS_SIZE / 2, 0, width);
  int yStart = constrain(mouseY - LENS_SIZE / 2, 0, height);
  int xEnd = constrain(mouseX + LENS_SIZE / 2, 0, width);
  int yEnd = constrain(mouseY + LENS_SIZE / 2, 0, height);
  loadPixels();
  for (int x = xStart; x < xEnd; ++x) {
    for (int y = yStart; y < yEnd; ++y) {
      color c = blend(x, y, hoff, skull);
      int loc = x + y * hoff.width;
      pixels[loc] = c;
    }
  }
  updatePixels();
  stroke(0);
  noFill();
  rect(xStart, yStart, LENS_SIZE, LENS_SIZE);
}

color blend(int x, int y, PImage foreground, PImage background) {
  int loc = x + y * foreground.width;
  color foregroundPixel = foreground.pixels[loc];
  color backgroundPixel = background.pixels[loc];
  float r = abs(red(foregroundPixel) - red(backgroundPixel));
  float g = abs(green(foregroundPixel) - green(backgroundPixel));
  float b = abs(blue(foregroundPixel) - blue(backgroundPixel));
  return color(r, g, b);
}


