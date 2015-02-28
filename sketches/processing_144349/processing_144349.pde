
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Joo Yong Gill
// ID: 201420108

int x = 0;
int y = 0;
int xspeed = 2;
int yspeed = 10;
int zspeed = 11;

void setup() {
  background(149, 184, 255);
  size (600, 600);
  smooth();
}

void draw() {
 

  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 8)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 8)) {
    yspeed = yspeed * -1;
  }

  stroke(0);
  fill(0);
  ellipse(y, x, 30, 30);
  line(y+100, x-10, x, y+100);

  stroke(0);
  fill(125, 18, 250);
  ellipse(y+50, x+100, 20, 20);
  line(x, x, x, y);

  stroke(0);
  fill(255);
  ellipse(y-50, x=20, 25, 25);
  line(y, x, x, x);

  stroke(0);
  fill(255);
  ellipse(y-100, x-10, 15, 15);
  line(y, x, y, y);

  stroke(4);
  strokeWeight(1);
  fill(0);
  ellipse(x, y, 10, 10);
  line(y, y, x, x);

  stroke(2);
  fill(18, 39, 255);
  ellipse(x+100, y-100, 8, 8);
  line(x, y, x, x);

  stroke(2);
  fill(0);
  ellipse(x+200, y, 12, 12);
  line(x, y, y, y);

  stroke(2);
  fill(255, 18, 54);
  ellipse(x, y, 12, 12);

  line(x, y, y, x);
}
