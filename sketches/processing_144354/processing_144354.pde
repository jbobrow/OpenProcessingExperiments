
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: CHOI Joo Hee
// ID:201420114

int x = 0;
int y = 0;
int z = 0;
int speed = 3;
int speed2 = 4;
int speed3 =-2;

void setup() {
  size(600, 600);
  smooth(400);
}

void draw() {
  background(211);
  x = x + speed;
  y = y + speed2;
  z = z + speed3;

  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
  if ((y > height) || (x < 0)) {
    speed2 = speed * -2;
  }
  if ((z > height) || (x < 0)) {
    speed3 = speed * 4;
  }

  noStroke();
  fill(100);
  triangle(x, width+z, 0, z, width-x, height-z);
  fill(x);
  quad(x, z, 0, height+z, height-x, 0, 0, width-z);
  fill(z);
  quad(width+x, 0, 0, width+y, width+z, 0, 0, 0);
  line(111, y, z, width-z);
  quad(width+z, x, width+x, width+y, width+y, width+z, 0, 0);
  quad(z, 0, width-z, width-x, 0, 0, x, y);
  fill(y);
  quad(10, 10, x, y, x, x, z, y);
  fill(y);
  quad(y, z, x, width-z, z, y, z, y);
}


