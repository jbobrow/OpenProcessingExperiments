
void setup()
{
  size(400,400);
}

void draw()
{
}

void keyPressed()
{
  int rot1 = int(random(255));
  int grun1 = int(random(255));
  int blau1 = int(random(255));
  
  int rot2 = int(random(255));
  int grun2 = int(random(255));
  int blau2 = int(random(255));
  
  int rot3 = int(random(255));
  int grun3 = int(random(255));
  int blau3 = int(random(255));
  
  int rot4 = int(random(255));
  int grun4 = int(random(255));
  int blau4 = int(random(255));
  
  float rotd1 = float(rot2 - rot1)/6;
  float grund1 = float(grun2 - grun1)/6;
  float blaud1 = float(blau2 - blau1)/6;
  
  float rotd2 = float(rot4 - rot3)/6;
  float grund2 = float(grun4 - grun3)/6;
  float blaud2 = float(blau4 - blau3)/6; 
  
  float rota1, rotb1, gruna1, grunb1, blaua1, blaub1;
  float R, G, B;
  
  for(int x = 0; x < 6; x++)
  {
    rota1 = rot1 + rotd1*x;
    rotb1 = rot3 + rotd2*x;
    gruna1 = grun1 + grund1*x;
    grunb1 = grun3 + grund2*x;
    blaua1 = blau1 + blaud1*x;
    blaub1 = blau3 + blaud2*x;
 
    for(int y = 0; y < 6; y++)
    {
      R = rota1 + (rotb1 - rota1)/6*y;
      G = gruna1 + (grunb1 - gruna1)/6*y;
      B = blaua1 + (blaub1 - blaua1)/6*y;
      
      fill(R, G, B);
      rect(400/6*x, 400/6*y, 400/6, 400/6);
      
    }    
  }
}
