
void setup() {
  size(600, 500);
  background(0);
  frameRate(60);
}

int dx = 2;
int dy = 3;
boolean xDirection;

int x = 50;
int y = 50;

void draw() {

  fill(255);

  for (int i=0; i<5; i++)
    ellipse(x+i*10, y+i*25, 25, 25);

  x = x + dx;
  y = y + dy;

  if (mousePressed) {
    if (xDirection) {
      dx = -dx;
    } else {
      dy = -dy;
    }
    xDirection = !xDirection;
  }
  if (x < 0 || x > 475) {
    dx = -1 * dx;
  }
  if ( y < 0 || y > 475) {
    dy = -1 * dy;
  }
}
