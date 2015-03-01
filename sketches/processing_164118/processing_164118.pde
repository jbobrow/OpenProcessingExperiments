
void setup()
{
  size(600,400);
}

void draw()
{
}

void keyPressed()
{
  float weis;
  
  int rot;
  int grun;
  int blau;
  
  for(int y = 0; y < 2; y++)
  {
    rot = int(random(255));
    grun = int(random(255));
    blau = int(random(255));
  
    for(int x = 0; x < 3; x++)
    {
      weis = random(1);
      fill(weis*rot, weis*grun, weis*blau);
      rect((100*x)+(300*y),0,100,400);
    }
  }
}
