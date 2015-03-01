
void setup() {
  size(500, 500);
  background(255);
  frameRate(10000);
}

void draw() {
  fill(255, 5);
  noStroke();
  rect(0, 0, 500, 500);
  translate(random(-10, 510), random(-10, 510));
  if (mousePressed) {
    rotate(random(10));
  }
  stroke(random(150), 100);
  line(0, 0, 30, 30);
  filter(ERODE);
}

