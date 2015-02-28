
PImage geometric;
PShape geobase;

void setup() {
  size(600, 600);
  smooth();
  background(0);
  strokeWeight(5);
  geometric = loadImage("geometric.jpg");
  geobase = loadShape("geobase2.svg");
}

void draw() {
  //  image(geometric,0,0,width,height);
  for (int a = 0; a < width; a += 120) {
    for (int b = -22; b < height; b += 55) {
      shape(geobase, a, b);
    }
  }
  for (int c = -60; c < width; c +=120) {
    for (int d = -45; d < height; d += 55) {
      shape(geobase, c, d);
    }
  }
}

