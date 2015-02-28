
void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  fill(255);
  noStroke();

  for (int i = 0; i < 10; i++) {
    rect(0, 0, 10, 10);

    translate(10, 0);
  }
}
