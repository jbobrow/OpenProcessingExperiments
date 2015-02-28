
void setup() {
  size(600, 800);
  background(50);
}
void draw() {
  if (mousePressed) {
    dibuja_circ(mouseX, mouseY);
    dibuja_circ(width-mouseX, mouseY);
    dibuja_circ(mouseX, height-mouseY);
    dibuja_circ(width-mouseX, height-mouseY);
  }
}
void dibuja_circ(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(abs(x), abs(y), 50, 50);
  noStroke();
  ellipse(0, 0, 10, 10);
  rotate(abs(x));
  rect(-20, 0, 40, 1);
  popMatrix();
}



