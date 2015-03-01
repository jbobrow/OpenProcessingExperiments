
void setup()
{
  size(500,500);
}

void draw()
{
}

void keyPressed()
{
  color c; 
  float frot, fgrun, fblau;
  
  int rot1 = int(random(255));
  int grun1 = int(random(255));
  int blau1 = int(random(255));
  
  int rot2 = int(random(255));
  int grun2 = int(random(255));
  int blau2 = int(random(255));
  
  int rot3 = int(random(255));
  int grun3 = int(random(255));
  int blau3 = int(random(255));
  
  float rotd1 = float(rot2-rot1)/500;
  float grund1 = float(grun2-grun1)/500;
  float blaud1 = float(blau2-blau1)/500;
  
  float rotd2 = float(rot3-rot1)/500;
  float grund2 = float(grun3-grun1)/500;
  float blaud2 = float(blau3-blau1)/500;
  
  for(int x = 0; x < 500; x++)
  {
    for(int y = 0; y < 500; y++)
     {
       frot = rot1 + (rotd1*x)+(rotd2*y);
       fgrun = grun1+(grund1*x)+(grund2*y);
       fblau = blau1+(blaud1*x)+(blaud2*y);
       c = color(frot, fgrun, fblau);
       set(x,y, c);
     } 
  }
}
  
  
  
  
  
  
  
  
  
