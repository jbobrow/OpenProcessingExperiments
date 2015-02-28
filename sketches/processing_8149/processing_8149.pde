
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
  background(0);
  noStroke();
  fill(96, 32);
}

void draw()
{
  if (mousePressed)
  {
    vx = random(-5, 5);
    vy = random(-5, 5);
    x = random(radius, width-radius);
    y = random(radius, height-radius);
  }
  
  if (x <= radius || x >= width-radius || y <= radius || y >= height-radius)
  {
    vx = random(-5, 5);
    vy = random(-5, 5);
  }

  x = x + vx;
  y = y + vy;

  x = constrain(x, radius, width  - radius);
  y = constrain(y, radius, height - radius);
  
  ellipse(x, y, radius, radius);
}


