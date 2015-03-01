
void setup() {
  size(500, 500);
  background(0, 300, 0);
}
 
float w = 25;
float h = 25;
float R=150;
float centerR=150;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=100;
float pathG=100;
float G=50;
float centerG=50;
float pathB=125;
float B=125;
float centerB=125;
 
void draw() {
  translate(250, 250);
  rotate(millis()/1000.0);
  pathR=centerR+R*sin(a);
  a=a+.4;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.04;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.3;
  noFill();
  h = w - 10;
  w = h + 20;
  h = w - 20;
  w = h + 11;
  if (w < 1) {
    w = 100;
    h = 150;
  }
  stroke(pathR, pathG, pathB);
  ellipse(50, 50, w, h);
  if (mousePressed) {
    filter(ERODE);
  }
}

