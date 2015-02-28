
void setup () {
  size(480, 120);
}
void draw() {
  juan(10, 10, 255, 20);
  pedro(110, 10, 125, 30);
  juan (350, 10, 190, 40);
  pedro(220, 10, 220, 15);
}
void juan(int x, int y, color c, int sizeOjos) {
  pushMatrix();
  translate(x, y);
  fill(c);
  ellipse (40, 40, 80, 100);
  fill(0);
  ellipse(20, 40, sizeOjos, sizeOjos);
  ellipse(60, 40, sizeOjos, sizeOjos);
  stroke(0);
  line(20, 70, 60, 70);

  popMatrix();
}
void pedro(int x, int y, color c, int sizeOjos) {
  pushMatrix();
  translate(x, y);
  fill(c);
  quad (10, 10, 80, 10, 50, 80, 40, 80);
  fill(200);
  ellipse(30, 25, sizeOjos, sizeOjos);
  ellipse(60, 25, sizeOjos, sizeOjos);
  stroke(0);
  fill (c);
  arc(45, 55, 20, 20, 0, PI);


  popMatrix();
}
