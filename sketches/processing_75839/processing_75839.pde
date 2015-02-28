
//Benson L, CP1 Mods 14-15, Doubling Shapes
int t = 2;
int x = 1;
int y = 1;
void setup()
{
  size(500, 500);
  textSize(100);
  frameRate(1);
}
void draw()
{
  background(random(255), random(255), random(255));
  while (x <= y)
  {
    fill(random(255), random(255), random(255), 100);
    ellipse(int(random(450)), int(random(450)), 78, 50);
    fill(random(255), random(255), random(255), 75);
    rect(int(random(450)), int(random(450)), 50, 50);
    x++;
  }
  if (x > y)
  {
    x = 1;
    y*=2;
  }
  if (y > 514)
  {
    y = 1;
  }
  if (t > 1100)
  {
    t = 2;
  }
  fill(0);
  text(t, 100, 100);
  t*=2;
}
