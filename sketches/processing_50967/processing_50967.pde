
// Scott Hendrickson
// @DrSkippy27
//
// Standard Map
// 2012-02-01

// model parameter 0.97 is "edge" of chaos
float _K = 0.97;

// data values
int n_trajectories = 85;
//
float[] y = new float[n_trajectories];
float[] x = new float[n_trajectories];
// prev data values
float[] xn = new float[n_trajectories];
float[] yn = new float[n_trajectories];

// Variables relating view frame of data
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
//  Methods
//
void setup() {
 smooth();
 frameRate(30);
 //size(dim, dim);
 size(640, 640);
 font = loadFont("SansSerif-12.vlw");
 initMap();
}

void initMap() {
 dataX1 = 0;
 dataX2 =  TWO_PI;
 dataY1 = 0;
 dataY2 =  TWO_PI;
 scalex = float(dim)/abs(dataX2 - dataX1);
 scaley = float(dim)/abs(dataY2 - dataY1);
 //  Center at 0,0
 xoff = 0;
 yoff = 0;
 //
 setScale(0,0,dim,dim);
}

void draw() {
  noStroke();
  //  
  for (int i=0; i < 40; i++) {
    for (int j=0; j < n_trajectories; j++) {
     yn[j] = y[j] + _K * sin(x[j]);
     xn[j] = x[j] + yn[j];
     // colors of trajectories
     fill(j*256/n_trajectories,100,200);
     ellipse(x[j]*scalex + xoff, y[j]*scaley + yoff, 1, 1);
     x[j] = xn[j]%(2*TWO_PI);
     y[j] = yn[j]%(2*TWO_PI);
    }
  }
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
  text("K = " + str(_K), 20, 35);
  //
  for (int j = 0; j<n_trajectories; j++) {
    x[j] = (dataX2 - dataX1)/2.;
    y[j] = dataY1 + (j+1)*(dataY2 - dataY1)/float(n_trajectories + 1);
  }
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

