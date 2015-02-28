
int xPos=0;

void setup()
{
  size(600, 400);
  smooth();
  frameRate(120);
}

void draw()
{
  background(124);
  
  ellipse(xPos, height/2, 20, 20);
  xPos+=1;
}
