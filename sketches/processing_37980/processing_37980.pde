
final int diam = 50;
final int inc = 5;
final int stepTime = 5;

int x = 0;
int y = 0;
int xDir = 1;
int yDir = 1;

int lastTime = 0;

void setup()
{
  smooth();
  size(437, 533);
  background(0, 255, 0);
}

void draw()
{
  int thisTime = millis();
  if (thisTime - lastTime >= stepTime) {
    fill(int(random(256)), int(random(256)), int(random(256)));
    drawBall();
    lastTime = thisTime;
  }
}

void drawBall()
{
  ellipse(x, y, diam, diam);
  x += (inc * xDir);
  y += (inc * yDir);
  if (x >= width || x <= 0) {
    xDir = -xDir;
  }
  if (y >= height || y <= 0) {
    yDir = -yDir;
  }
}


