
float r;
float g;
float b;
float a;
float diam;

void setup() {
  size(600, 400);
  frameRate(50);
  background(255);
  smooth();
}
 

void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(100);
  if (mousePressed) {
  noStroke();
  fill(r, g, b, a);
  ellipse(mouseX, mouseY, diam, diam)
  }
}
