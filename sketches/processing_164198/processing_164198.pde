
void setup()
{
  size(300,600);
}

void draw()
{
}

void keyPressed()
{
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  background((rot+grun+blau)/3);
  fill(rot, grun, blau);
  rect(50,50, 200, 500);
 
  fill(rot,0,0);
  triangle(90,190, 150, 60, 210,190);
 
  fill(0,grun,0);
  rect(80, 220, 140, 140);
  
  fill(0,0,blau);
  ellipse(150,450, 150,150);
  save("Test.png");
}
