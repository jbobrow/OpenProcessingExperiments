
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
  
  for(int x = 0; x < 5; x ++)
  {
  fill(rot, grun, blau);
  rect(x*100,0, 100,300);
  
  rot = 125 - int(float(125-rot)/5*8);
  grun = 125 - int(float(125-grun)/5*8);
  blau = 125 - int(float(255-blau)/5*8);
 
 }
  
}
