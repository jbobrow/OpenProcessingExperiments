
int size = 50;

int x = size;
int y = size;

int x1 = size;
int y1 = size;

int x2 = size;
int y2 = size;

int xSpeed = 10;
int ySpeed = 10;

int xSpeed1 = 5;
int ySpeed1 = 5;

int xSpeed2 = 30;
int ySpeed2 = 30;

void setup() {
  size(800, 600);
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

  if (x >= (width - size/2) || x <= size/2)
    xSpeed *= -1;

  if (y >= (height - size/2) || y <= size/2)
    ySpeed *= -1;

  if (x1 >= (width - size/2) || x1 <= size/2)
    xSpeed1 *= -1;

  if (y1 >= (height - size/2) || y1 <= size/2)
    ySpeed1 *= -1;

  if (x2 >= (width - size/2) || x2 <= size/2)
    xSpeed2 *= -1;

  if (y2 >= (height - size/2) || y2 <= size/2)
    ySpeed2 *= -1;

  ySpeed++;
  ySpeed1++;
  ySpeed2++;
}


