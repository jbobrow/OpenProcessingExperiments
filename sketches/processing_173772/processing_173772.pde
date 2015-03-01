
void setup()
{
  size(300,500);
}

void draw()
{
}

void keyPressed()
{
  background(255);
  
  int x1 = int(random(300));
  int y1 = int(random(500));
  int z1 = int(random(50))+25;
  
  int x2 = int(random(300));
  int y2 = int(random(500));
  int z2 = int(random(50))+25;
  
  int x3 = int(random(300));
  int y3 = int(random(500));
  int z3 = int(random(50))+25;
  
  int rot = int(random(255));
  int grun = int(random(255));
  int blau = int(random(255));
  
  fill(rot, 0, 0);
  ellipse(x1,y1, z1, z1);
  fill(0,grun,0);
  ellipse(x2,y2, z2, z2);
  fill(0,0,blau);
  ellipse(x3,y3, z3, z3);
 
  fill(rot,grun,blau);
  triangle(x1,y1, x2,y2, x3,y3);
  save("Test.png"); 
}
