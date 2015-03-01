
void setup()
{
  size(500, 500);
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
  
  fill(255-rot, 255-grun, 255-blau);
  ellipse(250,250, 400,400);
  
  fill(rot,grun,blau);
  ellipse(250,250, 125,125);
  
  ellipse(125,250, 63,63);
  
  ellipse(250,125, 63,63);
  
  ellipse(375,250, 63,63);
  
  ellipse(250,375, 63,63);
}
