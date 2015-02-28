
int x;
int y;

int x1;
int y1;

int x2;
int y2;

int xSpeed = 10;
int ySpeed = 10;

int xSpeed1 = 5;
int ySpeed1 = 5;

int xSpeed2 = 30;
int ySpeed2 = 30;

int size = 50;

void setup() {
  size(600, 400);
  smooth();
  //size(screen.width, screen.height);
  colorMode(HSB, 100, 100, 100, 100);
  background(100);
}

void draw() {
  fill(100, 0, 100, 15);
  rect(0, 0, width, height);

  fill(30, 80, 80);
  ellipse(x, y, size, size);
  
  fill(60, 80, 80);
  ellipse(x1, y1, size, size);
  
  fill(80, 80, 80);
  ellipse(x2, y2, size, size);

  x += xSpeed;
  y += ySpeed;

  x1 += xSpeed1;
  y1 += ySpeed1;

  x2 += xSpeed2;
  y2 += ySpeed2;

  if (x > width || x < 0)
    xSpeed *= -1;

  if (y > height || y < 0)
    ySpeed *= -1;

  if (x1 > width || x1 < 0)
    xSpeed1 *= -1;

  if (y1 > height || y1 < 0)
    ySpeed1 *= -1;

  if (x2 > width || x2 < 0)
    xSpeed2 *= -1;

  if (y2 > height || y2 < 0)
    ySpeed2 *= -1;

  ySpeed++;
  ySpeed1++;
  ySpeed2++;
}


