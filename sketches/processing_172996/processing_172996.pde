
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
  
  background((rot+grun+blau)/3);
  
  fill(rot, grun, blau);
  triangle(50, 450, 150, 150, 250, 450);
  
  fill(255-rot, 255-grun, 255-blau);
  ellipse(150,150, 100,100);
}
