
void setup() {
  size(200, 200);
  noLoop();  // draw() will not loop
}

void draw() {
  background(204);
  rectMode(CENTER);
  translate(100, 100);
  rotate(millis()/700.0);
  rect(0, 0, 100, 100);
}

void mousePressed() {
  loop();  // Holding down the mouse activates looping
}

void mouseReleased() {
  noLoop();  // Releasing the mouse stops looping draw()
}
