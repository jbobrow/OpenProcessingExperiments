
void setup()
{
  size(300,400);
}

void draw()
{
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  fill(rot,grun,blau);
  rect(0,0,150,200);
  fill((rot+grun+blau)/3);
  rect(150,0,150,200);
  fill((grun+blau)/2, (rot+blau)/2, (rot+grun)/2);
  rect(0,200,150,200);
  fill(255-rot, 255-grun, 255-blau);
  rect(150,200,150,200);
  save("Test.png");
}
