
//Em F, CP1 mods 4-5, 100 Shapes

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

  while (numCircles <= 100)
  {
    fill(random(256), random (256), random (256), 195);
    ellipse(int(random(500)), int(random(500)), 40, 40);
    numCircles++;
  }
}
