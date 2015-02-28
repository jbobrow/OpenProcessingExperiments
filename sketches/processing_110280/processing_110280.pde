
void setup() {
  size(800, 800);
  background(#FFFFFF);
  frameRate(10);
  strokeCap(SQUARE);
}

void draw() {

  stroke(randomColor());
  strokeWeight(500 + random(500));
  for (int i = 0; i < 2; i++) {
    fill(randomColor());
    shaperoonies();
  }
} 

color randomColor() {
  color c = color(random(255), random(255), random(255), random(100));
  return c;
}

void shaperoonies() {
  rect(random(800), random(800), random(800), random(800));
  ellipse(random(800), random(800), random(800), random(800));
  line(random(800), random(800), random(800), random(800));
}
