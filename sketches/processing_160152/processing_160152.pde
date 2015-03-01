
void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  frameRate(20);
  float r1 = random(width);
  float r2 = random(width);
  float r3 = random(width);
  strokeWeight(random(5, 50));
  stroke(r1, r2, r3, 50);
  line(r1, width, r3, 0);

}

