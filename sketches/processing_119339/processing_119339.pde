
PImage tower;

void setup() {
  size(250, 250);
  tower = loadImage("http://newsroom.ucla.edu/portal/ucla/artwork/9/7/1/4/9/97149/Necrotic_tumor-c.jpg");
  tower.loadPixels();
}

void draw() {
  image(tower, 0, 0);
}
