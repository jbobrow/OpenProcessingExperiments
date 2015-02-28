
// Scott Hendrickson
// @DrSkippy27
//
// Henon Map
// 2012-01-30

// model parameters
float _alpha = 1.4;
float _beta  = 0.3;

// data values
float x = 0.5;
float y = 0.0;
// prev data values
float xn;
float yn;

// Variables relating viewport to data
int dim = 640;
int xoff;
int yoff;
//
float scalex;
float scaley;

// data box
float dataX1;
float dataX2;
float dataY1;
float dataY2;

// mouse coords
int px;
int py;
int nx;
int ny;
//
boolean mouseDrag = false;
// erase box (redraw) parameters
int xc = 0;
int yc = 0;
int dxc = 0;
int dyc = 0;

PFont font;

//
void setup() {
 smooth();
 frameRate(256);
 // size(dim, dim);
 size(640, 640);
 font = loadFont("SansSerif-12.vlw");
 initMap();
}

void initMap() {
 dataX1 = -1.8;
 dataX2 =  1.8;
 dataY1 = -0.4;
 dataY2 =  0.4;
 scalex = dim/abs(dataX2 - dataX1);
 scaley = dim/abs(dataY2 - dataY1);
 //  Center at 0,0
 xoff = dim/2;
 yoff = dim/2;
 //
 setScale(0,0,dim,dim);
}

void draw() {
  noStroke();
  fill(0,256,200);
  //  
  xn = 1.0 - _alpha*x*x + y;
  yn = _beta*x;
  //
  ellipse(xn*scalex + xoff, yn*scaley + yoff, 1, 1);
  x = xn;
  y = yn;

}

void setScale(int x1, int y1, int x2, int y2) {
  dataX1 = (x1 - xoff) / scalex;
  dataX2 = (x2 - xoff) / scalex;
  dataY1 = (y1 - yoff) / scaley;
  dataY2 = (y2 - yoff) / scaley;
  //
  scaley = dim/abs(dataY2 - dataY1);
  scalex = dim/abs(dataX2 - dataX1);
  //
  xoff = int(-(dataX1 + dataX2)*scalex + dim)/2;
  yoff = int(-(dataY1 + dataY2)*scaley + dim)/2;
  //
  background(256);
  fill(0,256,200);
  textFont(font, 12);
  text("(" + str(dataX1) + ", " + str(dataY1) + ")", 20, 20);
  text("alpha = " + str(_alpha) + "  beta = " + str(_beta), 20, 35);
}

void mousePressed() {
  if (mouseEvent.getClickCount() == 2) {
    initMap();
  } else {
    px = mouseX;
    py = mouseY;
  }
  mouseDrag = false;
}

void mouseDragged() {
    mouseDrag = true;
    stroke(0, 0, 0);
    noFill();
    rect(xc, yc, dxc, dyc);
    stroke(256, 0 , 0);
    xc = px;
    yc = py;
    dxc = (mouseX - px);
    dyc = (mouseY - py);
    rect(xc, yc, dxc, dyc);
}

void mouseReleased() {
  if (mouseDrag) {
    nx = mouseX;
    ny = mouseY;
    if (nx < px) {
      int tmp = px;
      px = nx;
      nx = tmp;
    }
    if (ny < py) {
      int tmp = py;
      py = ny;
      ny = tmp;
    }  
    setScale(px, py, nx, ny);
    mouseDrag = false;
  }
}

