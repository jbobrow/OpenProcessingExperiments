
//copyright benjamin corwin 2012

int arraylength = 20;//edit for number of shapes
int [] radiusX = new int [arraylength];
int [] locationX = new int [arraylength];
int [] locationY = new int [arraylength];
int [] dx = new int[arraylength];
int [] dy = new int[arraylength];
color[] arraycolor = new color[arraylength];

void setup() {
  smooth();
  size(500,500);
  background(255);
  radiusXSetup();
  arraycolorSetup();
  dySetup();
  dxSetup();
  locationX();
  locationY();
}
void draw() {
  prepWindow();
  drawEllipses();
  drawLines();
  bounceEllipse();
  moveEllipse();
  //saveFrame("kinetic.jpg");
  //noLoop();
}

void prepWindow() {
  fill(255);
  rect(0,0,width,height);
}

void dySetup() {
  for (int i = 0; i<arraylength; i++) {
    dy[i] = int(random(-5,5));
} }

void dxSetup() {
  for (int i = 0; i<arraylength; i++) {
    dx[i] = int(random (-5,5));
} }
void arraycolorSetup() {
  for (int i = 0; i<arraycolor.length; i++) {
    arraycolor[i] = color(int(random(0,255)),int(random(0,255)),int(random(0,255)),int(random(100,200)));
} }

void locationX() {
  for ( int i = 0; i < locationX.length; i ++) {
    locationX[i] = int(random(0+radiusX[i],width-radiusX[i]));
} }

void locationY() {
  for ( int i = 0; i < locationY.length; i ++) {
    locationY[i] = int(random(0+radiusX[i],height-radiusX[i]));
} }

void radiusXSetup() {
  for ( int i = 0; i < radiusX.length; i ++) {
    radiusX[i] = int(random(10,100));
} }

void bounceEllipse() {
  for(int i = 0; i<arraylength; i++) {
    if(locationX[i] >= width - radiusX[i]/2) {
      dx[i] = - dx[i];
    }
    else if(locationX[i]<=0 + radiusX[i]/2) {
      dx[i] = - dx[i];
    }
    if(locationY[i] >= height - radiusX[i]/2) {
      dy[i] = - dy[i];
    }
    else if(locationY[i] <= 0 + radiusX[i]/2) {
      dy[i] = - dy[i];
    }
} }

void moveEllipse() {
  for(int i = 0; i<arraylength; i ++) {
    locationY[i] += dy[i];
    locationX[i] += dx[i];
} }
void drawEllipses() {
  for(int i = 0; i< arraylength; i ++) {
    noStroke();
    fill(arraycolor[i]);
    ellipse(locationX[i], locationY[i], radiusX[i], radiusX[i]);
} }

void drawLines() {
  //stroke(50,15);
  stroke(5,30);
  strokeWeight(1);
  for(int i = 0; i<arraylength; i ++) {
    point(locationX[i], locationY[i]);
    for(int n = 0; n + i < arraylength; n = n + 1) {
      line(locationX[i], locationY[i], locationX[i+n],locationY[i+n]);
} } }


