
void setup()
{
  size(500, 300);
}

void draw()
{
}

void keyPressed()
{
  int z = int(random(6));
  int rot1 = int(random(255));
  int grun1 = int(random(255));
  int blau1 = int(random(255));
  
  int rot2 = int(random(255));
  int grun2 = int(random(255));
  int blau2 = int(random(255));
  
  int drot = rot2 - rot1;
  int dgrun = grun2 - grun1;
  int dblau = blau2 - blau1;
  
  for(int x=0; x < z; x++)
  {
    fill(rot1 + (drot/z*x),grun1 + (dgrun/z*x),blau1 + (dblau/z*x));
    rect(500/z*x, 0, 600/z, 300);
  }
  save("Test.png");
}
