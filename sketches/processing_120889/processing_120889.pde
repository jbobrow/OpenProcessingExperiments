
float r;
float g;
float b;
float o;
float diam;
float x;
float y;

void setup()
{
  size(1000,1000);
  background(0);
}
void draw()
{
  r = random(255);
  g = random(255);
  b = random(255);
  o = random(255);
  diam = random(1000);
  x = random(width);
  y = random(height);
  noStroke();
  fill(r,g,b,o);
  rectMode(CENTER);
  rect(500,500, diam,diam);
}


