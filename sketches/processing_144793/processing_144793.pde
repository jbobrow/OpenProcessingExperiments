
void setup() {
  size(500, 500);
  background(255);
  noFill();
  frameRate(200);
  smooth();
}

float p = 0;
float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;


void draw() {
   pathR=centerR+R*sin(a);
  a=a+.03;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.03;

  p = p + 1;
  stroke(pathR, pathG, pathB);
  translate(250, 250);
  rotate(p);
  triangle(100, 200, 150, 100, 200, 200);
  if (mousePressed) {
  filter(ERODE);
  }
}
