
// schien@mail.ncku.edu.tw
// demo the movement of a bouncing ball
// this is incomplete and needs to be fixed

float x, y, w, h;

void setup() {
  size(200, 300);
  //frameRate(1);
  x = random(width);
  y = random(height);
  w = random(10);
  h = random(10);
  ellipse(x, y, 5, 5);
}

void draw() {
  background(200);
  if (x>= width || x<0 || y>=height || y<0) {
    w = -w;
    h = -h;
  }
  x = x+w;
  y = y+h;

  ellipse(x, y, 5, 5);
}


