
int pointillize = 20;
PImage img;
void setup() {
  size(600, 420);
  img= loadImage("newzealand.png");
}


void draw() {
  loadPixels();

  for (int i = 0; i < 5; i++) {
    // Pick a random point
    int x = int(random(img.width));
    int y = int(random(img.height));
    int loc = x + y*img.width;

    // Look up the RGB color in the source image
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);
    noStroke();

    // Draw an ellipse at that location with that color
    fill(r, g, b, 100);
    ellipse(x, y, pointillize, pointillize);
  }
}


