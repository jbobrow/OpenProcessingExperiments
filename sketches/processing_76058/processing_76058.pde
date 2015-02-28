
//Derek Kwong Mods 14/15
int x=1;
int y=1;
void setup()
{
  size(500, 500);
  background(0);
  frameRate(1);
}
void draw()
{ 
  while (x<=y)
  { 
    fill(random(0, 255), random(0, 255), random(0, 255));
    ellipse(random(0, 500), random(0, 500), random(0, 40), random(0, 40));
    x=x+1;
  }
  y=y*2;
}
