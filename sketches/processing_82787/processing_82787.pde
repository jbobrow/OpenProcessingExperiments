
void setup() {
  size (400, 400);
  background(255, 0, 50);
  noLoop();
}

void draw() {
  for (int i = 0; i<10; i++) {
  face (random(50, 350), random(50, 350), random(255), random(50, 200), random(50, 200), random(40), random(100,255));
  }
}

void face (int x, int y, int col, int w, int h, int smile, int op) {
  noStroke();
  fill(80, col, col, op);
  ellipse (x, y, w, h);
  
  fill (0);
  ellipse (x-20, y-20, 12, 12);
  ellipse (x+20, y-20, 12, 12);
  
  fill (255);
  ellipse (x-22, y-20, 4, 4);
  ellipse (x+18, y-20, 4, 4);
  ellipse (x, y, 15, 15);
  
  stroke(0);
  strokeWeight(5);
  line (x-smile, y+20, x+smile, y+20);
}
