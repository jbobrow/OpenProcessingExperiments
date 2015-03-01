
void setup()
{
  size(250, 400);
}

void draw()
{
}

void keyPressed()
{
  fill(random(255),random(255),random(255));
  rect(0,0, 125, 400);
  
  int rot = int(random(200)+55);
  int grun = int(random(200)+55);
  int blau = int(random(12));
  
  
  fill(rot, grun, blau);
  rect(125,0, 125, 400);
  
  fill(random(12), random(12), random(200)+50);
  ellipse(62,200,100,100);
  
  fill(255-rot, 255-grun, 255-blau);
  triangle(135,390, 186,10, 240,390); 
  save("Test.png");
}
