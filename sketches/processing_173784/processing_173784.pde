
void setup()
{
  size(500,500);
}

void draw()
{
}

void keyPressed()
{
  background(0);
  
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  fill(rot,grun,blau);
  triangle(0,500, 250,0, 500,500);
  
  fill(0,grun,0);
  triangle(0,500, 125,250, 250,500);
  
  fill(0,0,blau);
  triangle(250, 500, 375,250, 500,500);
  
  fill(rot,0,0);
  triangle(125,250, 250,0, 375,250);
}
