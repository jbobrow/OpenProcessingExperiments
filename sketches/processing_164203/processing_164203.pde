
void setup()
{
  size(300, 500);
}

void draw()
{
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  fill(rot, grun, blau);
  rect(0,0, 100,500);
  
  float grau = (rot+grun+blau)/3;
  fill(grau);
  rect(100,0, 100,500);
  
  float rot2 = (grun+blau)/2;
  float grun2 = ( rot+blau)/2;
  float blau2 = (rot+grun)/2;
  
  float grau2 = (rot2+grun2+blau2)/3;
  float ausgleich = grau / grau2;
  rot2 = rot2*ausgleich;
  grun2 = grun2*ausgleich;
  blau2 = blau2*ausgleich;
  
  fill(rot2, grun2, blau2);
  rect(200,0, 100,500);
  save("Test.png"); 
}
