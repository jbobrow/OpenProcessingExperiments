
void setup()
{
  size(500,300);
}

void draw()
{
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  for(int x = 0; x < 3; x++)
  {
    fill(rot+random(64)-32,grun+random(64)-32,blau+random(64)-32);
    rect(500/3*x,0, 500/3,150);
  }
  for(int y = 0; y < 3; y++)
  {
    fill(rot+random(250)-125,grun+random(250)-125,blau+random(250)-125);
    rect(500/3*y,150, 500/3,150);
  }
}
