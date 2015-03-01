
void setup() {
  size(500, 500);
  background(255);
}

float a, b;

void draw() {
  noStroke();
  fill(255, 10);
  rect(0, 0, 600, 600);
  stroke(random(100, 255));
  a = random(520);
  b = random(520);
  if (mousePressed) {
    stroke(100, a/2, b/2);
  }
  translate(a, b);
  line(0, 0, 20, 0);
  filter(ERODE);
}


