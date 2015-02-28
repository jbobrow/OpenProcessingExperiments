
int x = 0;
int y = 0;

int bx = 3;
int by = 2;

void setup() {
  size(300,300);
  strokeWeight(2);
}

void draw() {
  fill(225);
  rect( 0, 0, 300, 300 );
  fill(255,247, 0);
  ellipse( x, y, 25, 25);
  ellipse( y, x, 25, 25);
  ellipse( x, x, 25, 25);
 
  x += bx;
  y += by;
  if (x > 300 || x < 0) {
    bx = bx * -1;
  }
  if (y > 300 || y < 0) {
    by = by * -1;
  } 
}



