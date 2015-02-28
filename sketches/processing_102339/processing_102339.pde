
int w = 5;
int t = 0;
int a = 0;

float rad = 0;
float r = 10;

void setup()
{
  size(640, 480);
  background(0);
  stroke(255);
  strokeWeight(4);
}

void draw()
{
  t = (t + 1 > width) ? 0 : t + 1;
  a = (a + 100 > height) ? 0 : a + 100;
  makeSin();
  makeCircle();
}

void makeSin()
{
  int y = (int) (50 * sin(w * t)) + a;
  stroke(255, 255, map(mouseY, 0, height, 0, 255), map(mouseX, 0, width, 0, 255));
  point(t, y);
  stroke(255, map(mouseY, 0, height, 0, 255), 255, map(mouseX, 0, width, 0, 255));
  point(t, y + a);
}

void makeCircle()
{
  int x = (int)(width / 2 + r * Math.cos(rad));
  int y = (int)(height / 2 + r * Math.sin(rad));
  
  point(x, y);
  
  rad = (rad + 0.1 > 2 * 3.14) ? 0 : rad + 0.1;
  r = (r + 0.5 > width / 2) ? 0: r + 0.5;
}
