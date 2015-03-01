
void setup()
{
  size(550,350);
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
  rect(75,50, 400, 250);
  
  fill((grun+blau)/2, (rot+blau)/2, (rot+grun)/2);  
  ellipse(275,175, 300, 200);
  save("Test.png");
}
