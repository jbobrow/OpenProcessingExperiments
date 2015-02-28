
// Keith O'Hara <kohara@bard.edu>
// Feb 8 2010 Lecture

float x, y;

void setup()
{
  size(500, 500);
  smooth();
  x = random(width);
  y = random(height);
  background(0);
}

float sign(float x)
{
  if (x < 0)
  {
    return -1;
  }
  else if (x > 0)
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

void draw()
{
  noFill();
  strokeWeight(6);
  colorMode(HSB);
  stroke(x % 255, 255, 255, 64);
  float dx = sign(mouseX - x);
  x = x + dx;
  float dy = sign(mouseY - y);
  y = y + dy;
  ellipse(x, y, 50, 50);
}


