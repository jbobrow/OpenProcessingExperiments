
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  int z1 = int(random(6));
  int z2 = int(random(6));
  
  float rot = random(255);
  float grun = random(255);
  float blau = random(255);
  
  float rot2;
  float grun2;
  float blau2;
  
  for(int x1 = 0; x1 < z1; x1++)
  {
    for(int x2 = 0; x2 < z2; x2++)
    {
      rot2 = rot + random(255/6)-255/12;
      blau2 = blau + random(255/6)-255/12;
      grun2 = grun + random(255/6)-255/12;
      fill(rot2, grun2, blau2);
      rect(300/z1*x1, 500/z2*x2, 300/z1, 500/z2);
    }
  }
  save("Test.png");
}
