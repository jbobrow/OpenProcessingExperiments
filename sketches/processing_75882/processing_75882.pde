
//Justin L., DoublingShapes, CP1 Mods 16/17

int y = 1;
int i = 1;
void setup()
{
  size(500, 500);
  frameRate(10);
  smooth();
}
void draw()
{
  background(255);
  while ( i < y )
  {
    ellipse((random(500)), (random(500)), (random(40)), (random(50)));
    fill(int(random(255)), int(random(255)), int(random(255)));
    i++;
  }
  while ( i >= y )
  {
    y = y * 2;
  }
  if ( i >=  5096 )
  {
    i = 1;
    y = 1;
  }
}
