
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
  
  background(255-rot, 255-grun, 255-blau);
  
  fill(rot, grun, blau);
  rect(50,100,200,300);
  save("Test.png");
}

