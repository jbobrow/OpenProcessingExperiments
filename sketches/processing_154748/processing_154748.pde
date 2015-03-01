
float r = 0;

void setup()
{
  size(400,400);
  background(0);
  smooth();
  noStroke();
}


void draw()
{
  fill(random(0),random(225),random(255));
  rotate(r);
  ellipse(0+r, 10, 9, 9);
  r = r + 0.2;
}


