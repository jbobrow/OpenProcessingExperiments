
void setup()
{
  size(900,300);
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
  rect(0,0,150,300);
  
  fill((grun+blau)/2, (rot+blau)/2, (rot+grun)/2);
  rect(150,0,150,300);
  
  fill(255-rot, 255-grun, 255-blau);
  rect(300,0,150,300);
  
  fill(255-(grun+blau)/2, 255-(rot+blau)/2, 255-(rot+grun)/2);
  rect(450,0,150,300);
  
  fill((rot+grun+blau)/3);
  rect(600,0,150,300);
  
  fill(255-(rot+grun+blau)/3);
  rect(750,0,150,300);
  save("Test.png");
}
