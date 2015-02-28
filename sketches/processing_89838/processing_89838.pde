
int x = 0, speedX = 1;
float r, g, b;
int s, t;
int p = 1;

void setup()
{
  frameRate(60);
  size(200, 200);
  println("Everytime a second passes, it will be displayed here");
}

void draw()
{
  fillShape();
  drawEllipse(100);
  calculateTimePass();
}

void drawEllipse(int posY)
{
  background(255);
  ellipse(x, posY - 20, 10, 10);
  ellipse((width - x), height/2 + 20, 10, 10);
  x = x + speedX;
  if (x > width || x < 0)
  {
    speedX = speedX * -1;
  }
}

void fillShape()
{
  if (frameCount % 120 == 0)
  {
    r = random(255);
  }
  g = frameCount%5;
  s = second();
  if (s % 2 == 0)
  {
    b = b*.567;
  }
  t = mouseX*255/width;
  t = 255 - t;
  if (r < 0) r = 0;
  if (r > 255) r = 255;
  if (g < 0) g = 0;
  if (g > 255) g = 255;
  if (b < 0) b = 0;
  if (b > 255) b = 255;
  noStroke();
  fill(r, g, b, t);
}

void calculateTimePass()
{
  if (frameCount % 60 == 0)
  {
  println(p + " seconds elapsed");
  p = p + 1;
  }
}
