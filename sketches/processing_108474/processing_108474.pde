
// sierpinski fractal
// ref: en.wikipedia.org/wiki/Sierpi%C5%84ski_curve
// play around with n, nOmit, bufSize 
// warning: larger n will slow down

int n;   // levels
int h0;
int h, x, y, x0, y0;
int nOmit;     // levels to be omitted
int[] prevx, prevy;
int bufSize, counter;
boolean isFirst, isOne;

void setup() {
  size(800, 600);
  n = 4;      // levels
  nOmit = 2;  // levels to be omitted, must < n
  h0 = 512;

  bufSize = 4;   // number of sub-vertices in group
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
  prevx = new int[bufSize];
  prevy = new int[bufSize];
  
  for (int i=0; i<bufSize; i++) {
    prevx[i] = -1;
    prevy[i] = -1;
  }
  counter = 0;
  isFirst = false;
  isOne = true;
}

void display() {
  // objects to display each cycle
  ABCD();  
}

void drive() {
  //bufSize++;
  //n++;
  inits();
  //if (bufSize > 20) noLoop();
  //if (n > 5) n = 1;
  // put cycle variable changes here..
}

void plot() {
  // plot the sierpinski vertices, 
  // here it's grouped in bufSize sub-vertices
  if (prevx[0] < 0 && prevy[0] < 0) {
    for (int i=0; i < bufSize; i++) {
      prevx[i] = x0;
      prevy[i] = y0;
    }
  }
  prevx[counter] = x;
  prevy[counter] = y;
  
  float cr = random(200, 255);
  float cg = random(80, 255);
  float cb = random(120, 255);
  stroke(cr, cg, cb, 0);   // default isOne, no draw
  fill(cr, cg, cb, 0);
  
  int px, py;
  if (counter == 0) {
    px = prevx[bufSize-1];
    py = prevy[bufSize-1];
  }
  else {
    px = prevx[counter-1];
    py = prevy[counter-1];
  }
  if (!isOne) { 
    stroke(cr, cg, cb, 200);
    fill(cr, cg, cb, 200);
  }
  if (isFirst) {
    line(x0, y0, x, y);
    isFirst = false;
  }
  else {
    line(px, py, x, y);
  }
  if (!isOne) {
    stroke(cr, cg, cb, 127);
    fill(cr, cg, cb, 127);
  }
  
  if (counter >= (bufSize-1)) {
    beginShape();
    for (int i=0; i<bufSize; i++) {
      vertex(prevx[i], prevy[i]);
    }
    endShape();
    
    //quad(prevx[0], prevy[0], prevx[1], prevy[1], prevx[2], prevy[2], prevx[3], prevy[3]);
    //ellipse(x, y, 8, 8);
    counter = 0;
  }
  else {
    counter++;
  }
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
    if (i <= 2) 
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


