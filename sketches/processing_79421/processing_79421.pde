
void setup() {
  size(200, 120);
}

void draw() {
  cara(10, 10, 255, 10, 12);
  cara2(110, 10, 125, 15);
}

void cara(int x, int y, color c, int sizeOjos, int sizeDientes) {
  pushMatrix();
  translate(x, y);
  fill(c);
  ellipse(40, 40, 80, 80);
  fill(0);
  ellipse(25, 35, sizeOjos, sizeOjos);
  ellipse(55, 35, sizeOjos, sizeOjos);
  noFill();
  rect(30, 61, sizeDientes, sizeDientes);
  rect(50, 60, 10, 10);
  stroke(0);
  line(20, 55, 60, 55);
  popMatrix();
}

void cara2(int x, int y, color c, int sizeOjos) {
  pushMatrix();
  translate(x, y);
  fill(c);
  rectMode(CENTER);
  rect(40, 40, 80, 80, 7);
  fill(255);
  ellipse(20, 25, sizeOjos, sizeOjos);
  ellipse(60, 25, 25, 25);
  fill(0);
  ellipse(60, 25, 10, 10);
  ellipse(20, 25, 5, 5);
  stroke(0);
  line(20, 55, 40, 60);
  line(40, 60, 60, 55);

  popMatrix();
}
