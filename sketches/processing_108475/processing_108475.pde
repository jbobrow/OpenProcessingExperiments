
// sierpinski fractal, basic version, no color
// ref: en.wikipedia.org/wiki/Sierpi%C5%84ski_curve
// play around with n and nOmit, warning: larger n will slow down

int n;     // levels
int h0;
int h, x, y, x0, y0;
int nOmit;     // levels to be omitted
int prevx, prevy;
boolean isFirst, isOne;

void setup() {
  size(800, 600);
  n = 4;      // levels
  nOmit = 2;  // levels to be omitted, must < n
  
  h0 = 512;
  inits();
  
  stroke(#ffffff);   // default
  strokeWeight(2);
  noLoop();
}

void draw() {
  background(0);
  display();  // display objects
  drive();    // variables changes
}

void inits() {
  // initial values for each cycle
  prevx = -1;
  prevy = -1;
  isFirst = false;
  isOne = true;
}

void display() {
  // objects to display each cycle
  ABCD();  
}

void drive() {
  inits();
  // put cycle variable changes here..
}

void plot() {
  // plot the sierpinski vertices, 
  // basic no color
  if (prevx < 0 && prevy < 0) {
    prevx = x0;
    prevy = y0;
  }

  if (isOne) {    // to be omitted
    stroke(#ffffff, 0);
    fill(#ffffff, 0);
  }
  else {
    stroke(#ffffff);
    fill(#ffffff);
  }
  if (isFirst) {
    line(x0, y0, x, y);
    isFirst = false;
  }
  else {
    line(prevx, prevy, x, y);
  }

  prevx = x;
  prevy = y;
}

// all sierpinski recursive..
void A(int i) {
  if (i > 0) {
    A(i-1); 
    x += h; y -= h; plot();
    B(i-1);
    x += 2*h; plot();
    D(i-1);
    x += h; y += h; plot();
    A(i-1);
  }  
}

void B(int i) {
  if (i > 0) {
    B(i-1); 
    x -= h; y -= h; plot();
    C(i-1);
    y -= 2*h; plot();
    A(i-1);
    x += h; y -= h; plot();
    B(i-1);
  }  
}

void C(int i) {
  if (i > 0) {
    C(i-1); 
    x -= h; y += h; plot();
    D(i-1);
    x -= 2*h; plot();
    B(i-1);
    x -= h; y -= h; plot();
    C(i-1);
  }  
}

void D(int i) {
  if (i > 0) {
    D(i-1); 
    x += h; y += h; plot();
    A(i-1);
    y += 2*h; plot();
    C(i-1);
    x -= h; y += h; plot();
    D(i-1);
  }  
}

void ABCD() {
  h = h0/4;
  x0 = 2*h;
  y0 = 3*h;

  for (int i=1; i <= n; i++) {
    if (i <= nOmit) 
      isOne = true;
    else
      isOne = false; 
    x0 -= h;
    h /= 2;
    y0 += h;
    x = x0;
    y = y0;
    isFirst = true;
    A(i);
    x += h; y -= h; plot();
    B(i);
    x -= h; y -= h; plot();
    C(i);
    x -= h; y += h; plot();
    D(i);
    x += h; y += h; plot();
  }
}


