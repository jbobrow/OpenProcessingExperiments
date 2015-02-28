
int w=128, h=128;
float a=0;

void setup() {
  size(256,192,P3D);
  frameRate(25);
}

void draw() {
  translate(64,96,0);
  rotateX(a);
  background(0);
  rect(0,0,w,h);
  a+=0.1;
}
