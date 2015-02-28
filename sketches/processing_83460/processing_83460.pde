
void setup() {
  size(500, 500);
}
 
void draw() {
  background(25,25,112);
  cara(130, 200, 58,95,205, 20);
  cara2(260, 200,255,255,0, 15);
}
 
void cara(int x, int y, color r, color g, color b, int sizeOjos) {
  pushMatrix();
  translate(x, y);
  fill(r,g,b);
  ellipse(40, 40, 100, 130);
  fill(255);
  ellipse(25, 35, sizeOjos, sizeOjos);
  ellipse(55, 35, sizeOjos, sizeOjos);
  fill(0);
  ellipse(30, 35, 10,10);
  ellipse(60, 35, 10,10);
  stroke(0);
  strokeWeight(2);
  line(20, 55, 60, 55);
  popMatrix();
}
 
void cara2(int x, int y, color r, color g, color b, int sizeOjos) {
 
 pushMatrix();
  translate(x, y);
  fill(r,g,b);
  ellipse(40, 40, 100, 100);
  fill(0);
  ellipse(25, 30, sizeOjos, sizeOjos);
  stroke(0);
  line(-5, 55, 55, 55);
  popMatrix();
}
