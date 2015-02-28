
void setup () {
  size (800, 600);
}

void draw () {
  monoA (20, 10, 255, 10);
  monoA (60, 100, 100, 20);
  monB(300, 350, 150, 20);
  monB(400, 200, 255, 30);
}


void monoA (int x, int y, color P, int eye) {
  pushMatrix();
  translate(x, y);
  fill(P);
  beginShape();
  vertex (50, 50);
  vertex (70, 30);
  vertex (90, 30);
  vertex (110, 50);
  vertex (100, 80);
  vertex (60, 80);
  endShape(CLOSE);
  fill (0);
  ellipse (70, 50, eye, eye);
  ellipse (90, 50, eye, eye);
  popMatrix();
}
void monB (int x, int y, color P, int ojo) {
  pushMatrix();
  translate(x, y);
  fill(P);
  beginShape();
  vertex (100, 100);
  vertex (120, 90);
  vertex (140, 90);
  vertex (160, 100);
  vertex (170, 300);
  vertex (90, 300);
  endShape(CLOSE);
  fill (0);
  ellipse (200, 200, ojo, ojo);
  
  popMatrix();


}
