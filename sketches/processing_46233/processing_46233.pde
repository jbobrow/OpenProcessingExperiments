
int sizeX = 600;
int sizeY = 400;
int color_maximum = sizeY;
int star_count = 100;
int creation_radius = 100;
float multiplier_precision = 20.0;
Starfield starfield;

void setup() {
  size(600, 400); // Must match sizeX and sizeY above.
  colorMode(HSB, color_maximum);
  starfield = new Starfield(star_count, creation_radius);
}

void draw() {
  background(0, 0, 0);
  starfield.update();
}


