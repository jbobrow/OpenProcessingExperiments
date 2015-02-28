
// Exercise 4-4b. Reproducing images and using variables.

int startX = 100;
int startY = 100;
int line01EndX = 100;
int line01EndY = 0;
int line02EndX = 0;
int line02EndY = 200;
int line03EndX = 200;
int line03EndY = 200;

int backgroundColor = 225;
int strokeColor = 0;

void setup() {
  size(200, 200);
}

void draw() {
  background(backgroundColor);
  stroke(strokeColor);
  line(startX, startY, line01EndX, line01EndY);
  line(startX, startY, line02EndX, line02EndY);
  line(startX, startY, line03EndX, line03EndY);
  ++startX;
  --startY;
  --line01EndX;
  ++line01EndY;
  --line02EndX;
  --line02EndY;
  --line03EndX;
  --line03EndY;
  strokeColor += 1;
}
