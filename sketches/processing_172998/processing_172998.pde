
void setup()
{
  size(500,500);
}

void draw()
{
}

void keyPressed()
{
  
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  background(rot,grun,blau);
  
  fill(random(255), random(255), random(255));
  triangle(0,50, 500,250, 0,450);
  fill(random(255), random(255), random(255));
  triangle(500,50, 0,250, 500,450);
  fill(random(255), random(255), random(255));
  triangle(500,250, 250,150, 250,350);
  
}
