
// Example of a Nested For Loop

void setup() {

  size(600, 800);
  background(0);
  smooth();
  noStroke();
  rectMode(CENTER);
}

void draw() {
  for (int x = 0; x <= width; x += 40) {
    for (int y = 0; y <= height; y += 40) {
      rect(x, y, 20, 20);
    }
  }
}



