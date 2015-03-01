
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  float durch = (rot+grun+blau)/3;
  
  float rd = durch - rot;
  float gd = durch - grun;
  float bd = durch - blau;
  
  rd = rd / 5 * 8;
  gd = gd / 5 * 8;
  bd = bd / 5 * 8;
  
  float rot1 = durch -rd;
  float grun1 = durch -gd;
  float blau1 = durch -bd;
  
  fill(rot, grun, blau);
  rect(0,0, 150,500);
  fill(rot1, grun1, blau1);
  rect(150,0, 150,500);
}
