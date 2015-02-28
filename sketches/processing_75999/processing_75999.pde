
//Em F, CP1 mods 4-5, Doubling Shapes

int halt = 1;
void setup()
{
  size(500, 500);
  background(0);
  smooth();
  noStroke();
  frameRate(1);
}
void draw()
{
  int numCircles = 1;
  background(0);
  while (numCircles <= halt)
  {
    fill(random(256), random (256), random (256), 195);
    ellipse(int(random(500)), int(random(500)), 40, 40);
    numCircles = numCircles+1;
  }
  halt = halt*2;
  if (halt > 2000)
  {
    background(0);
    halt = 1;
    numCircles = 1;
  }
}
