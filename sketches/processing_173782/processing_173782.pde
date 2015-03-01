
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
  ellipse(250,250, 400, 400);
  
  float a = float(400)/8*5;
  
  fill(255-rot, 255-grun, 255-blau);
  rect( 250-(a/2), 250-(a/2), a, a);
  save("Test.png");
}
