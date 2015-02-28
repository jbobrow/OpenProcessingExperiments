
int modulo, base, stpt;
float ballRad = 10;
float speed = .5;
float step, p;
PVector curr, start, goal;

void setup() {
  size(650, 650);

  smooth();
  setValues(11, 144);
}

void setValues(int b, int m) {
  modulo = m;
  base = b;

  stpt = b;
  start = numToPoint(stpt, base, modulo);
  curr = numToPoint(stpt, base, modulo);
  goal = numToPoint(nextNum(stpt, base, modulo), base, modulo);

  step = speed*ballRad/(start.dist(goal));
  p = 0;

  colorMode(HSB, modulo);
  background(0);
}

void draw() {
  fill(0, 1);
  rect(-10, -10, width+10, height+10);
  paintDots();
  fill(stpt, 100, 100);
  stroke(0);
  ellipse(curr.x, curr.y, ballRad, ballRad);
  curr = nextPoint(start, goal, p);
  if (p >= 1) {
    stpt = nextNum(stpt, base, modulo);
    start = numToPoint(stpt, base, modulo);
    goal = numToPoint(nextNum(stpt, base, modulo), base, modulo);
    p = 0;
    step = speed*ballRad/(start.dist(goal));
  }
  p += step;
}

void paintDots() {
  float rad = width/1.5;
  stroke(modulo);
  noFill();
  for (int i=0; i<modulo; i++) {
    PVector loc = numToPoint(i, base, modulo);
    ellipse(loc.x, loc.y, ballRad, ballRad);
  }
}


int nextNum(int n, int b, int m) {
  return (n*b)%m;
}

PVector numToPoint(int n, int b, int m) {
  //Easy circle:
  float rad = width/2.5;
  float x = width/2 + rad*cos(n*2*PI/m - PI/2);
  float y = height/2 + rad*sin(n*2*PI/m - PI/2);
  return new PVector(x, y);
}

PVector nextPoint(PVector strt, PVector gl, float p) {
  if (p>1)
    p=1;
  return new PVector(lerp(strt.x, gl.x, p), lerp(strt.y, gl.y, p));
}

void keyPressed() {
  if (key == CODED) {
    int _b = base;
    int _m = modulo;
    switch(keyCode) {
    case UP:
      _m++;
      break;
    case DOWN:
      _m = max(2, _m-1);
      break;
    case LEFT:
      _b = (_b-1)%_m;
      break;
    case RIGHT:
      _b = (_b+1)%_m;
      break;
    }
    setValues(_b, _m);
  }
}



