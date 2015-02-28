
int modulo = 37; //I also like 13, 3
int power = 18;
boolean curved = true;
boolean useEllipse = false;

void setup() {
  size(700, 400);
  background(0);
  hoverNum =0;
  createVals();
  smooth();
  strokeWeight(2);
  preDraw();
  noLoop();
}

void createVals() {
  colorMode(HSB, modulo, 100, 100);
  background(0);
  fill(0);
  stroke(modulo);
}

PVector getPlacement(int i) {//Any function from Z to RxR
  float x, y;
  if (useEllipse) {
    y = height/2 + (height/2-10)*sin(i*2*PI/modulo - PI/2);
    x = width/2 + (width/2-10)*cos(i*2*PI/modulo - PI/2);
  }
  else {  
    x = width/(0.25*(modulo*modulo*modulo)) * pow(i - 0.5*modulo, 3) + 0.5*width;
    y = 0.5*height + (0.5*height-20)*cos(i*2*PI/(modulo));
  }
  return new PVector(x, y);
}

void preDraw() {
  noFill();
  stroke(modulo);

  beginShape();
  PVector start = getPlacement(0);
  curveVertex(start.x, start.y);
  for (int i=1; i<modulo; i++) {
    PVector point = getPlacement(i);
    curveVertex(point.x, point.y);

    fill(modulo);
    stroke(modulo);
    ellipse(point.x, point.y, 5, 5);
    noFill();
  }
  PVector end = getPlacement(modulo);
  curveVertex(end.x, end.y);
  endShape();
}

void markConnection(PVector loc0, PVector loc1, int id0, int id1) {
  stroke(id0, 100, 100);
  noFill();
  if (curved)
    bezier(loc0.x, loc0.y, 0.5*(loc0.x+loc1.x), loc0.y, loc1.x, loc1.y, loc1.x, loc1.y);
  else
    line(loc0.x, loc0.y, loc1.x, loc1.y);
}

void markStartingPoint(PVector loc0, int id0, int id1) {
  noFill();
  stroke(id0, 100, 100);
  ellipse(loc0.x, loc0.y, 10, 10);
}

void markEndingPoint(PVector loc1, int id0, int id1) {
  fill(id1, 100, 100);
  stroke(id0, 100, 100);
  ellipse(loc1.x, loc1.y, 10, 10);
}

void draw() {
  for (int n=0; n<modulo; n++)
  {
    int nextNum = computeNext(n);
    PVector loc0 = getPlacement(n);
    PVector loc1 = getPlacement(nextNum);

    markConnection(loc0, loc1, n, nextNum);
    markStartingPoint(loc0, n, nextNum);
    markEndingPoint(loc1, n, nextNum);    

    if (n == hoverNum) {
      nextHoverNum = nextNum;
      noFill();
      stroke(n, 100, 100);
      ellipse(loc0.x, loc0.y, 20, 20);
      stroke(nextNum, 100, 100);
      ellipse(loc1.x, loc1.y, 20, 20);
    }
  }
}

int computeNext(int lastNum) {
  int nextNum = 1;
  for (int n=0; n<power; n++) {
    nextNum = (nextNum*lastNum) % modulo;
  }
  return nextNum;
}

void update() {
  createVals();
  preDraw();
  redraw();
}

int getModulo() {
  return modulo;
}

void setModulo(int m) {
  modulo = m;
}
int getPower() {
  return power;
}
void setPower(int p) {
  power = p;
}
void curveToggle() {
  curved = !curved;
}
void shapeToggle() {
  useEllipse = !useEllipse;
}

void mousePressed() {
  PVector mouseLoc = new PVector(mouseX, mouseY);
  for (int i=0; i<=modulo; i++) {
    PVector intLoc = getPlacement(i);
    if (intLoc.dist(mouseLoc) < 10 && i!=hoverNum) {
      updateHoverNum(i);
      update();
    }
  }
}
int hoverNum;
int nextHoverNum;
int getHoverNum() {
  return hoverNum;
}
int getNextHoverNum() {
  return nextHoverNum;
}
void updateHoverNum(int i) {
  hoverNum = i;
  int nextNum = computeNext(i);
  if (javascript != null)
    javascript.updateMouseNum(i, nextNum, power, modulo);
}

interface JavaScript {
  void updateMouseNum(int n, int nn, int p, int m);
}
void bindJavascript(JavaScript js) {
  javascript = js;
}
JavaScript javascript;


