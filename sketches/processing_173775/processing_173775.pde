
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
  
  fill(rot, grun, blau);
  ellipse(250,250,400,400);
  
  fill(255-rot,255-grun,255-blau);
  float a = 3.14/3;
  triangle(250,50, 250.0-sin(a)*200.0,250.0+cos(a)*200.0, 250.0+sin(a)*200, 250+cos(a)*200);
}
