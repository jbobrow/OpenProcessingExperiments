
void setup() {
  size(190, 100);
}
void draw() {
  gordo(10, 10, 255, 20, 150);
  loco(110, 10, 125, 10, 4);
}

void gordo (int x, int y, color c, int sizeOjos, color n) {
  pushMatrix();
  stroke(n);
  strokeWeight(1);
  translate(x, y);
  fill(c);
  ellipse(40, 40, 100, 100);
  fill(0);
  ellipse(25, 25, 20, 20);
  ellipse(55, 25, 20, 20);
  
  line(20, 55, 60, 55);


  popMatrix();
}

void loco (int x, int y, color c, int sizeOjos,int h) {
  pushMatrix();
  stroke(118,36,36);
  strokeWeight(h); 
  translate(x, y);
  fill(c);
  ellipse(40, 40, 60, 60);
  fill(0);
  ellipse(20, 46, 20, 20);
  ellipse(60, 40, 20, 20);
  line(20, 55, 60, 55);


  popMatrix();
}
