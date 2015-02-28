
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
  line(width+x, width-y, x, y+100);

  stroke(0);
  fill(125, 18, 250);
  ellipse(width+x, width-y, 20, 20);
  line(x, x, x, y);

  stroke(0);
  fill(255);
  ellipse(width-50, height+30, 25, 25);
  line(y, x, x, x);

  stroke(0);
  fill(255);
  ellipse(width-y, height+x, 45, 45);
  line(y, x, y, y);

  stroke(4);
  strokeWeight(1);
  fill(0);
  ellipse(width+x, width-y, 30, 30);
  line(y, y, x, x);

  stroke(1);
  strokeWeight(1);
  fill(196, 244, 255);
  triangle(x, 0, 0, y, width+x, height-y);
  line(y, y, x, x);

  stroke(1);
  strokeWeight(1);
  fill(13, 208, 255);
  triangle(x, 0, 0, y, width+y, height-x);
  line(y, y, x, x);


 stroke(1);
  strokeWeight(1);
  fill(13, 208, 255);
  triangle(0, 0, width+y, y, width+y, height-x);
  line(y, y, x, x);



  stroke(2);
  fill(18, 39, 255);
  ellipse(y, width+x, 8, 8);
  line(x, y, x, x);

  stroke(2);
  fill(0);
  ellipse(x+200, y, 12, 12);
  line(x, y, y, y);

  stroke(2);
  fill(255, 18, 54);
  ellipse(width+x, y, 30, 30);

  line(x, y, y, x);
}

