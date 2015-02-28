
// Keith O'Hara <kohara@bard.edu>
// March 8 2010 Lecture

float x, y, vy, vx;
int radius = 25;

void setup()
{
  size(500, 500);
  smooth();
  x = width/2;
  y = height/2;
  vx = random(-5, 5);
  vy = random(-5, 5);
}

void draw()
{
  background(0);
  if (mousePressed)
  {
    vx = random(-5, 5);
    vy = random(-5, 5);
    x = random(radius, width-radius);
    y = random(radius, height-radius);
  }

  if (x <= radius || x >= width-radius)
  {
    background(255, 0, 0);
    vx = -1*vx;
  }

  if (y <= radius || y >= height-radius)
  {
    background(0, 0, 255);
    vy = -1*vy;
  }

  x = x + vx;
  y = y + vy;

  x = constrain(x, radius, width  - radius);
  y = constrain(y, radius, height - radius);

  ellipse(x, y, radius, radius);
}



