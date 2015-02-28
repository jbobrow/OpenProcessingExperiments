
// Exercise 4-5. Sketch relative to width and height.

void setup() {
  size(200, 400);
  background(255);
  rectMode(CENTER);
}

void draw() {
  line(0, 0, width, height);
  line(0, height, width, 0);
  fill(100);
  rect(width / 10, height / 2, width / 10, height / 10);
  rect(width - width / 10, height / 2, width / 10, height / 10);
  ellipse(width / 2, height / 2, width / 3, height / 3);
}
