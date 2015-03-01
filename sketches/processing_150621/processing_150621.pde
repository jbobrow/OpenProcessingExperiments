
void setup() {
  size(500, 500);
  background(255);
}

float a = 500;
float b = 1;
float c;
float d = 1; 
float w = 500;
float h = 0;
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
  noStroke();
  c = c + d;
  a = a - b;
  if ( a < 1) {
    a = 500;
    c = 0;
    background(255);
  }
  fill(pathR, pathG, pathB);
  if (keyPressed) {
    if (key == 'z') {
      a = 500;
      b = b + 1;
      background(255);
    }
    if (key == 'x') {
      a = 500;
      b = b - 1;
    }
    if (key == 'c') {
      a = 500;
      background(255);
      d = d + 1;
    }
    if (key == 'v') {
      background(255);
      a = 500;
      d = d - 1;
    }
    if (key == 'a') {
      stroke(0);
    }
    if (key == 's') {
      stroke(pathR, pathG, pathB);
    }
    if (key == 'd') {
      stroke(0, pathG, pathB);
    }
    if (key == 'f') {
      stroke(pathR, 0, pathB);
    }
    if (key == 'g') {
      stroke(pathR, pathG, 0);
    }
    if (key == 'h') {
      stroke(pathR, 0, 0);
    }
    if (key == 'j') {
      stroke(0, pathG, 0);
    }
    if (key == 'k') {
      stroke(0, 0, pathB);
    }
    if (key == 'l') {
      stroke(pathR);
    }
    if (key == ';') {
      stroke(255);
    }
    if (key == 'q') {
      fill(0, pathG, pathB);
    }
    if (key == 'w') {
      fill(pathR, 0, pathB);
    }
    if (key == 'e') {
      fill(pathR, pathG, 0);
    }
    if (key == 'r') {
      fill(pathR, 0, 0);
    }
    if (key == 't') {
      fill(0, pathG, 0);
    }
    if (key == 'y') {
      fill(0, 0, pathB);
    }
    if (key == 'u') {
      fill(pathG);
    }
    if (key == 'b') {
      filter(ERODE);
    }
    if (key == 'n') {
      filter(DILATE);;
    }
  }
  if (mousePressed) {
    if (mouseButton == LEFT) {
      fill(255);
    } 
    if (mouseButton == RIGHT) {
      fill(0);
    }
  }
  if (b < 1) {
    b = 1;
  }
  if (d < 1) {
    d = 1;
  }
  translate(250, 250);
  rotate(c);
  rectMode(CENTER);
  rect(0, 0, a, a);
}
