
void setup()
{
  smooth();
  background(#000000);
  size(300, 300);
  noStroke();
}

float x, y;
float targetX, targetY;
float easing = 0.05;

void draw()
{
  fill(#000000, 32);
  rect(0, 0, width, height);
  targetX = mouseX;
  targetY = mouseY;
  float dx = targetX - x;
  float dy = targetY - y;
  if(abs(dx) > 1)
  {
    x += dx * easing;
  }
  if(abs(dy) > 1)
  {
    y += dy * easing;
  }
  fill(#FFFFFF);
  ellipse(x, y, 25, 25);
}
