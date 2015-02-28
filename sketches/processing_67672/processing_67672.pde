
int y = 0;
int x = 0;
int endY = 0;
int endX = 0;

void setup() {
  size(500, 500);
  frameRate(10);
}

void draw() {
  background(0);
  //drawing horizontal lines.
  for (int y=0; y < endY; y+=10) {
    stroke(30, 250, 0);
    line(0, y, width, y);
  }

  //drawing vertical lines
  for (int x=0; x < endX; x+=10) {
    stroke(30, 250, 0);
    line(x, 0, x, height);
  }

  endY += 10;
  endX += 10;

  if (mousePressed) {
    endY = 0;
    endX = 0;
  }
}

