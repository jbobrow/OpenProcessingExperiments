
float c=255;
float c1=#c695fc;
float c2=#b186e0;
float x=0;

void setup()
{
  frameRate(15);
  size(250, 250);
  background(#FFE180);
  noStroke();
  smooth();
}
 
void draw()
{
  x+=10;
  fill(#FFE180);
  rect(0, 0, width, height);
  fill(c, c1, c2, 100);
  ellipse(125, 125, x, x);
  ellipse(125, 125, x+20, x+20);
  ellipse(125, 125, x+60, x+60);
  ellipse(125, 125, x+100, x+100);
  ellipse(125, 125, x+140, x+140);
  ellipse(125, 125, x+180, x+180);
  if (x>=400)
  {
    x=-10;
  }
}
 




