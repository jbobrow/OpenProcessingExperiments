
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Jihye
// ID: 201420116



int x = 0;
int y = 0;
int x2 = 0;
int y2 = 0;
int xSpeed = 3;
int ySpeed = 2;
int xSpeed2 = 2;
int ySpeed2 = 3;

void setup() {
  size(600, 600);
  smooth();
  background(0);
  colorMode(RGB);
}

void draw() {

  x = x + xSpeed;
  y= y + ySpeed;
  x2 = x2 + xSpeed2;
  y2= y2 + ySpeed2;

  if ((x > width) || (x < 0)) {

    xSpeed = xSpeed * -1;
  }
  if ((y > height) || (y < 0)) {
    ySpeed = ySpeed * -1;
  }
  if ((x2 > width) || (x2 < 0)) {

    xSpeed2 = xSpeed2 * -1;
  }
  if ((y2 > height) || (y2 < 0)) {
    ySpeed2 = ySpeed2 * -1;
  }

  noFill();
  stroke(255, 30);

  quad (x, height-y, width, y2, width, y, x, y2 );
  quad (y, width, x2, y2, height, y, x, y);
}

