
void setup() {
  size(500, 500);
  background(0);
}
 
float w = 500;
float h = 0;
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
  translate(250, 250);
  rotate(millis()/10000.0);
  pathR=centerR+R*sin(a);
  a=a+.03;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  noFill();
  h = h + 10;
  w = w - 10;
  if (w < 1) {
    w = 500;
    h = 0;
  }
  stroke(pathR, pathG, pathB);
  rect(0, 0, w, h);
  if (mousePressed) {
    filter(ERODE);
  }
}

void setup() {
  size(500, 500);
  background(0);
}
 
float w = 500;
float h = 0;
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
  translate(250, 250);
  rotate(millis()/10000.0);
  pathR=centerR+R*sin(a);
  a=a+.03;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  noFill();
  h = h + 10;
  w = w - 10;
  if (w < 1) {
    w = 500;
    h = 0;
  }
  stroke(pathR, pathG, pathB);
  rect(0, 0, w, h);
  if (mousePressed) {
    filter(ERODE);
  }
}


