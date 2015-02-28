
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Min Kyung Kim
// ID: 201420065

int a = 0;
int b = 0;
int aSpeed = 4;
int bSpeed = 2;
float angle;

void setup() {
  size (600, 600);
  smooth();
  background(#dcd0c4);
}

void draw() {

  a = a + aSpeed;
  b = b + bSpeed;

  if ((a > 500) || (a < 0)) {
    aSpeed = aSpeed * -1;
  }
  if ((b > 500) || (b < 0)) {
    bSpeed = bSpeed * -1;
  }

  noStroke();
  fill(255);
  rect (a, b, 15, 15);   
  rect (b, a, 15, 15);

  noStroke();
  translate(300, 300);
  scale(0.5);
  angle += 0.03;
  rotate(angle);
  fill(#df242b);
  rect(50, 50, 30, 100);
  translate(100, 100);
  angle += 0.02;
  rotate(angle);
  fill(#ff5b47);
  rect(50, 50, 30, 100);
  translate(300, 150);
  angle += 0.01;
  rotate(angle);
  fill(#9f927f);
  rect(50, 50, 30, 100);
}

