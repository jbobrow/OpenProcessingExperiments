
// Victor Murillo, CP1, mods 16/17, Doubling Shapes
int i= 1;
int count = 1;
void setup()
{ 
  size(400, 400);
  frameRate(1);
}
void draw()
{
  background(0);
  while (i <= count)
  {

    fill(11, 64, 216, 127);
    ellipse(int(random(400)), int(random(400)), 40, 40);
    i++;
  }
  if (i >= count)
  {
    count = count*2;
  }
  if (i > 1400)
  {
    i = 1;
    count = 1;
  }
}
