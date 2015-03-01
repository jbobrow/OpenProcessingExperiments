
void setup()
{
  size(800,500);
}

void draw()
{
}

void keyPressed()
{
  
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  int z = int(random(6));
  int k;
  
  for(int x = 0; x < z; x++)
  {  
    fill(rot, grun, blau);
    rect(800/z*x, 0, 800/z, 125);
    fill((rot+grun+blau)/3);
    rect(800/z*x, 125, 800/z, 125);
    fill(((255-rot)+(255-grun)+(255-blau))/3);
    rect(800/z*x, 250, 800/z, 125);
    fill(255 - rot, 255-grun, 255-blau);
    rect(800/z*x, 375, 800/z, 125);
    
    k = int(random(3));
    if ( k == 0)
    {
      rot = 255-rot;
    }
    if ( k == 1)
    {
      grun = 255-grun;
    }
    if ( k == 2)
    {
      blau = 255-blau;
    }
      
    
  }
  save("Test.png");
}















