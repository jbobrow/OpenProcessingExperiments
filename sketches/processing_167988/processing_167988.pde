
void setup() {
  size(500, 500);
  background(255);
}

float a = 0;
float b = 300.0;
float R=125;
float centerR=125;
float z=PI/2;
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
  pathR=centerR+R*sin(z);
  z=z+.03;
 
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
 
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  a++;
  stroke(a/3);
  if (keyPressed) {
    if (key == 'z') {
      a = 0;
      b = b + 10.0;
      background(255);
    }
    if (key == 'x') {
      a = 0;
      b = b - 10.0;
    }
    if (key == 'c') {
      stroke(pathR, pathG, pathB);
    }
  }
  noFill();
  strokeWeight(10);
  translate(245, 245);
  rotate(millis()/b);
  ellipse(30, 30, a, a);
}

