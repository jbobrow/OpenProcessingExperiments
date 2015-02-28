
//globals
int pX, pY, rX, rY;
boolean release = true;
boolean ddwC, ddbC, uuwC, uubC, dwC, dbC, uwC, ubC = false;
 
Poly ddwS = drawShape(200, 0);
Poly ddbS = drawShape(300, 0);
Poly uuwS = drawShape(0, 100);
Poly uubS = drawShape(100, 100);
Poly dwS = drawShape(200, 100);
Poly dbS = drawShape(300, 100);
Poly uwS = drawShape(0, 200);
Poly ubS = drawShape(100, 200);
Poly swS = drawShape(200, 200);
Poly sbS = drawShape(300, 200);
 
void setup() {
  size(420, 300);
  background(255);
}
 
void draw() {
  stroke(255, 0, 255);
  udw();
  drawArrow(35, 40, 0, true);
  udb();
  drawArrow(135, 40, 0, true);
  ddw(ddwC);
  drawArrow(225, 40, 0, false);
  drawArrow(235, 40, 0, false);
  ddb(ddbC);
  drawArrow(325, 40, 0, false);
  drawArrow(335, 40, 0, false);
  uuw(uuwC);
  drawArrow(25, 160, PI, false);
  drawArrow(35, 160, PI, false);
  uub(uubC);
  drawArrow(125, 160, PI, false);
  drawArrow(135, 160, PI, false);
  dw(dwC);
  drawArrow(235, 140, 0, false);
  db(dbC);
  drawArrow(335, 140, 0, false);
  uw(uwC);
  drawArrow(35, 260, PI, false);
  ub(ubC);
  drawArrow(135, 260, PI, false);
  fill(255);
  swS.drawMe();
  drawStar(235, 245);
  fill(0);
  sbS.drawMe();
  drawStar(335, 245);
}
 
void drawStar(int locX, int locY){
  pushMatrix();
  translate(locX,locY);
  line(0,0, 12,12);
  line(12,0, 0,12);
  line(6,-2, 6,12);
  line(-2,6, 12,6);
  popMatrix();
}
 
void drawArrow(int locX, int locY, float rotation, boolean ud) {
  pushMatrix();
  translate(locX, locY);
  rotate(rotation);
  line(0, 0, 0, 20);
  line(0, 20, -5, 15);
  line(0, 20, 5, 15);
  if (ud) {
    line(0, 0, -5, 5);
    line(0, 0, 5, 5);
  }
  popMatrix();
};
 
Poly drawShape(int offsetX, int offsetY) {
  int[] sx = new int[6];
  int[] sy = new int[6];
  sx[0] = 20+offsetX;
  sx[1] = 60+offsetX;
  sx[2] = 60+offsetX;
  sx[3] = 100+offsetX;
  sx[4] = 100+offsetX;
  sx[5] = 20+offsetX;
  sy[0] = 20+offsetY;
  sy[1] = 20+offsetY;
  sy[2] = 60+offsetY;
  sy[3] = 60+offsetY;
  sy[4] = 100+offsetY;
  sy[5] = 100+offsetY;
  Poly newShape = new Poly(sx, sy, 4);
  return newShape;
}
 
void udw() {
  Poly newShape = drawShape(0, 0);
  if (release == false) {
    if (newShape.contains(pX, pY)) {
      fill(0);
      newShape.drawMe();
    }
  }
  else {
    fill(255);
    newShape.drawMe();
  }
}
 
void udb() {
  Poly newShape = drawShape(100, 0);
  if (release == false) {
    if (newShape.contains(pX, pY)) {
      fill(255);
      newShape.drawMe();
    }
  }
  else {
    fill(0);
    newShape.drawMe();
  }
}
 
void ddw(boolean clicked) {
  if (clicked == true) {
    fill(0);
    ddwS.drawMe();
  }
  else {
    fill(255);
    ddwS.drawMe();
  }
}
 
void ddb(boolean clicked) {
  if (clicked == true) {
    fill(255);
    ddbS.drawMe();
  }
  else {
    fill(0);
    ddbS.drawMe();
  }
}
 
void uuw(boolean clicked) {
  if (clicked == true) {
    fill(0);
    uuwS.drawMe();
  }
  else {
    fill(255);
    uuwS.drawMe();
  }
}
 
void uub(boolean clicked) {
  if (clicked == true) {
    fill(255);
    uubS.drawMe();
  }
  else {
    fill(0);
    uubS.drawMe();
  }
}
 
void dw(boolean clicked) {
  if (clicked == true) {
    fill(0);
    dwS.drawMe();
  }
  else {
    fill(255);
    dwS.drawMe();
  }
}
 
void db(boolean clicked) {
  if (clicked == true) {
    fill(255);
    dbS.drawMe();
  }
  else {
    fill(0);
    dbS.drawMe();
  }
}
 
void uw(boolean clicked) {
  if (clicked == true) {
    fill(0);
    uwS.drawMe();
  }
  else {
    fill(255);
    uwS.drawMe();
  }
}
 
void ub(boolean clicked) {
  if (clicked == true) {
    fill(255);
    ubS.drawMe();
  }
  else {
    fill(0);
    ubS.drawMe();
  }
}
 
void mousePressed() {
  pX = mouseX;
  pY = mouseY;
  release = false;
  if (ddwS.contains(pX, pY)) ddwC = !ddwC;
  if (ddbS.contains(pX, pY)) ddbC = !ddbC;
  if (dwS.contains(pX, pY)) dwC = true;
  if (dbS.contains(pX, pY)) dbC = true;
}
 
void mouseReleased() {
  rX = mouseX;
  rY = mouseY;
  if (uuwS.contains(rX, rY)) uuwC = !uuwC;
  if (uubS.contains(rX, rY)) uubC = !uubC;
  if (uwS.contains(rX, rY)) uwC = true;
  if (ubS.contains(rX, rY)) ubC = true;
  release = true;
}
 
class Poly extends java.awt.Polygon {
  public Poly() {
    super();
  }
 
  public Poly(int[] x, int[] y, int n) {
    super(x, y, n);
  }
 
  void drawMe() {
    beginShape();
    for (int i=0; i<npoints; i++) {
      vertex(xpoints[i], ypoints[i]);
    }
    endShape(CLOSE);
  }
}


