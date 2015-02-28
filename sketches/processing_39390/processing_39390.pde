

//Homework #2 - Bouncing Sphere

float xd=50;
float yd=50;
float zd=50;
int leftwall = 300;
int rightwall = 300;
int topwall = 250;
int backwall = 0;
int xwidth = 610;
int ywidth = 510;
int zwidth = 710;
float x=0;
float y=0;
float z=0;

void setup() {
  size (800, 700, P3D);
  frameRate(15);
}
void draw() {
  lights();
  background(250);
  stroke(0,0,500);
  translate(leftwall, topwall, backwall);
  noFill();
  box(xwidth, ywidth, zwidth);
  ball();
}
void ball() {
  moveball();
  translate(x, y, z);
  fill(0);
  stroke(255,0,0);
  sphere(20);
}
void moveball() {
  x +=xd;
  y +=yd;
  z +=zd;
  
  if (x<-.5*xwidth) {
    xd=-xd;
  }
  if (x>.5*xwidth) {
    xd=-xd;
  }
  if (y<-.5*ywidth) {
    yd=-yd;
  }
  if (y>.5*ywidth) {
    yd=-yd;
  }
  if (z<-.5*zwidth) {
    zd=-zd;
  }
  if (z>.5*zwidth) {
    zd=-zd;
  }
}
  

