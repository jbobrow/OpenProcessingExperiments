
float x = 0;
float y = 0;
float xspeed = 2.2;
float yspeed = 1.5;
int diameter = 10;

void setup() {
  size(200, 200);
}

void draw() {
  background(255);

  x = x + xspeed;
  y = y + yspeed;

  if ((x > width-diameter/2) || (x < 0)) {
    xspeed = xspeed * -1;
  }

  if ((y > height-diameter/2) || (y < 0)) {
    yspeed = yspeed * -1;
  }

  stroke(1);
  fill(175);
  ellipse(x, y, diameter, diameter);
}



