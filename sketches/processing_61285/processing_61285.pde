
void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  fill(255);
  noStroke();

  for (int i = 0; i < 10; i++) {
    rect(0, 0, 30, 30);

    translate(40, 0);
  }
}
