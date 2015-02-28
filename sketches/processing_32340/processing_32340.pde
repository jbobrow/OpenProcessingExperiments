
void setup() {
  size(500, 500);
  smooth();
  noStroke();
  noLoop();
}
void draw() {
  for (int i=0; i<=100; i++) {
    color randomColor = color(random(0, 255), random(0, 255), random(0, 255), 255-i*2.55);
    fill(randomColor);
  triangle(random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500));
    rect(random(0, 500), random(0, 500), random(0, 500), random(0, 500));
    quad(random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500), random(0, 500));
    ellipse(random(0, 500), random(0, 500), random(0, 500), random(0, 500));
  }
}


