
int modulo = 30;
int base = 8;
float x0, y0;
float lineLength;

void setup() {
  size(340, 560);
  background(0);
  createVals();

  strokeWeight(2);
  smooth();

  preDraw();
  noLoop();
}

void createVals() {
  colorMode(HSB, modulo);
  background(0);
  fill(0);
  stroke(modulo);
  lineLength = height/2-15;
  line(10, height/2, width-10, height/2);
}


void preDraw() {

  for (int i=0; i<modulo; i++) {
    x0 = width/2;
    y0 = height/2 + (i-base)*lineLength/modulo;
    ellipse(x0, y0, 5, 5);
  }
  fill(base, 100, 100);
  noStroke();
  ellipse(width/2, height/2, 15, 15);
  
  noFill();
  stroke(modulo);
  
  line(width/2, height/2 - base*lineLength/modulo, width/2, height/2 + (modulo-base)*lineLength/modulo);
  
}

void draw() {
  int lastNum = base;
  int n = 0;
  do {
    int nextNum = computeNext(lastNum);
    x0 = width/2;
    y0 = height/2 + (lastNum-base)*lineLength/modulo;
    float x1 = width/2;
    float y1 = height/2 + (nextNum-base)*lineLength/modulo;

    stroke(n, 100, 100);
    noFill();

    bezier(x0, y0, 10-5*n, y0+n, width-10+5*n, y1+n, x1, y1);

	
	
    noFill();
    stroke(lastNum, 100, 100);
    ellipse(x0, y0, 15, 15);
    lastNum = nextNum;
    n++;
  }  while (n<modulo && lastNum != base);
}


int computeNext(int lastNum) {
  return (base*lastNum)%modulo;
}

void update() {
  createVals();
  preDraw();
  redraw();
}

int getBase() {
  return base;
}
void setBase(int b) {
  base = b;
}
int getModulo() {
  return modulo;
}
void setModulo(int m) {
  modulo = m;
}


