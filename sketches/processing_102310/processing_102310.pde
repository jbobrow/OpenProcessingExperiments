
int modulo = 30;
int base = 8;
float x0, y0;
float R, thetaStep;
boolean curved = true;

void setup() {
  size(560, 560);
  background(0);
  R = width/2 - 30;
  createVals();
  smooth();
  strokeWeight(2);
  preDraw();
  noLoop();
}

void createVals() {
  colorMode(HSB, modulo);
  background(0);
  fill(0);
  stroke(modulo);
  ellipse(width/2, height/2, 2*R, 2*R);
}


void preDraw() {
  thetaStep = 2*PI/modulo;
  for (int i=0; i<modulo; i++) {
    x0 = width/2 + R*cos(i*thetaStep - PI/2);  
    y0 = height/2 + R*sin(i*thetaStep - PI/2);
    ellipse(x0, y0, 5, 5);
  }
  fill(base, 100, 100);
  noStroke();
  ellipse(width/2 + R*cos(base*thetaStep - PI/2), height/2 + R*sin(base*thetaStep - PI/2), 15, 15);
}

void draw() {
  int lastNum = base;
  int n=0;
  do {
    int nextNum = computeNext(lastNum);
    x0 = width/2 + R*cos(lastNum*thetaStep - PI/2);
    y0 = height/2 + R*sin(lastNum*thetaStep - PI/2);
    float x1 = width/2 + R*cos(nextNum*thetaStep - PI/2);
    float y1 = height/2 + R*sin(nextNum*thetaStep - PI/2);

    stroke(n, 100, 100);  
    noFill();
    if (curved)
		bezier(x0, y0, 0.5*(x0+x1),y0, x1,y1, x1,y1);
	else
      line(x0, y0, x1, y1);

    noFill();
    stroke(lastNum, 100, 100);
    ellipse(x0, y0, 15, 15);
    lastNum = nextNum;
    n++;
  }  while (n < modulo && lastNum != base);
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
void curveToggle(){
	curved = !curved;
}


