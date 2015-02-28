
boolean showingFrames = false;

void setup() {
  size(300, 300);
  smooth();
  noLoop();
}

void draw() {
  background(0);
  strokeWeight(3);
  stroke(60, 40, 100);
  fill(100, 90, 140);
  roundTriangle(80, 20, 150, 130, 30, 140);
  
  strokeWeight(5);
  stroke(30, 180, 90);
  fill(20, 150, 70);
  roundRect(40, 190, 200, 80);

  strokeWeight(2);
  stroke(200, 100, 150);
  fill(100, 50, 70);
  roundQuad(180, 60, 240, 50, 290, 170, 170, 160);
  
  if(showingFrames) {
    noFill();
    stroke(255);
    strokeWeight(1);
    triangle(80, 20, 150, 130, 30, 140);
    rect(40, 190, 200, 80);
    quad(180, 60, 240, 50, 290, 170, 170, 160);
  }
}

void mousePressed() {
  showingFrames = !showingFrames;
  redraw();
}

void keyPressed() {
  showingFrames = !showingFrames;
  redraw();
}

void roundTriangle(int x1, int y1, int x2, int y2, int x3, int y3) {
  int x12 = (x1 + x2) / 2;
  int y12 = (y1 + y2) / 2;
  int x23 = (x2 + x3) / 2;
  int y23 = (y2 + y3) / 2;
  int x31 = (x3 + x1) / 2;
  int y31 = (y3 + y1) / 2;
  beginShape();
  vertex(x31, y31);
  bezierVertex(x1, y1, x1, y1, x12, y12);
  bezierVertex(x2, y2, x2, y2, x23, y23);
  bezierVertex(x3, y3, x3, y3, x31, y31);
  endShape();
}

void roundQuad(int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4) {
  int x12 = (x1 + x2) / 2;
  int y12 = (y1 + y2) / 2;
  int x23 = (x2 + x3) / 2;
  int y23 = (y2 + y3) / 2;
  int x34 = (x3 + x4) / 2;
  int y34 = (y3 + y4) / 2;
  int x41 = (x4 + x1) / 2;
  int y41 = (y4 + y1) / 2;
  beginShape();
  vertex(x41, y41);
  bezierVertex(x1, y1, x1, y1, x12, y12);
  bezierVertex(x2, y2, x2, y2, x23, y23);
  bezierVertex(x3, y3, x3, y3, x34, y34);
  bezierVertex(x4, y4, x4, y4, x41, y41);
  endShape();
}

void roundRect(float x, float y, float a, float b) {
  int cx, cy, rx, ry;
  switch(g.rectMode){
    case CORNER:
      cx = int(x + a / 2);
      cy = int(y + b / 2);
      rx = int(a / 2);
      ry = int(b / 2);
      break;
    case CORNERS:
      cx = int((a + x) / 2);
      cy = int((b + y) / 2);
      rx = int((a - x) / 2);
      ry = int((b - y) / 2);
      break;
    case CENTER:
      cx = int(x);
      cy = int(y);
      rx = int(a / 2);
      ry = int(b / 2);
      break;
    default: // RADIUS
      cx = int(x);
      cy = int(y);
      rx = int(a);
      ry = int(b);
      break;
  }
  r(cx, cy, rx, ry);
}
void r(int x, int y, int rx, int ry) {
  pushMatrix();
  translate(x, y);
  beginShape();
  vertex(rx, 0);
  bezierVertex(rx, ry, rx, ry, 0, ry);
  bezierVertex(-rx, ry, -rx, ry, -rx, 0);
  bezierVertex(-rx, -ry, -rx, -ry, 0, -ry);
  bezierVertex(rx, -ry, rx, -ry, rx, 0);
  endShape();
  popMatrix();
}

