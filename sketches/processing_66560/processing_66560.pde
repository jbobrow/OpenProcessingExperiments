
int x = 250;
int y = 250;
int xspeed = 1;
int yspeed = 3;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {

  background(0);

  x = x + xspeed;
  y = y + yspeed;

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }

  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  ellipse(x, y, 25, 25);
}


