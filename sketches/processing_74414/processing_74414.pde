
//Hayley G, CP1, mods 14-15

void setup()
{
  size(500, 500);
  frameRate(.5);
}
void draw()
{
  background(0);
  int x = 1;
  while (x<=100) 
  {
    fill(int(random(255)), int(random(255)), int(random(255)), int(random(255)));
    triangle(30, 450, 450, 430, int(random(500)), int(random(500)));
    x++;
  }
}
