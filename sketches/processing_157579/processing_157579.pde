
//Day 51 #create365
//Uses 2D Perlin noise example from Dan Shiffman's Nature of Code

float d;
float xint;
float yint;

void setup() {
  size(640, 640);
  smooth();
 xint = 0;
yint = 0.2;
}

void draw() {
  float mx = map(mouseX, 0, width, -5, -1);
  float my = map(mouseY, 0, height, -5, -1);

  loadPixels();
  float xoff = xint;
  for (int x = 0; x < width; x++) {
    float yoff = yint;
    for (int y = 0; y < height; y++) {
      float r = map(noise(xoff, yoff), 0, 1, 0, 255);
      float g = map(noise(yoff, xoff), 0, 1, 0, 255);
      float b = map(noise(xoff-yoff, xoff), 0, 1, 0, 255);

      pixels[x+y*width] = color(r, g, b);
      yoff += -pow(10, my) - pow(10, -5*noise(xoff, yoff));
    }
    xoff += -pow(10, mx) + -pow(10, -5*noise(xoff, xoff));
  }
  updatePixels();
}

void mouseClicked() {
  xint = random(1000);
  yint = random(1000);
}

