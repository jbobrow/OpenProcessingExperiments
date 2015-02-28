
int xPos = 150;
int yPos = 200;
int xSize;
int ySize;

color strokeColor;
color fillColor;

void setup()
{
  xSize = 100;
  ySize = 100;
  strokeColor = color(255,255,255);
  fillColor = color(0,128,255);
  color bgColor = color(0,0,0);
  
  size(400,400);
  background(bgColor);
}

void draw()
{
  //variable arguments
  drawEllipse(strokeColor, fillColor, xPos, yPos, xSize, ySize);
  
  //literal arguments
  drawEllipse(color(255,255,255), color(0,128,255), 250, 200, 100, 100);
}

void drawEllipse(color strClr, color flClr, int xP, int yP, int xS, int yS)
{
  stroke(strClr);
  fill(flClr);
  ellipse(xP,yP,xS,yS);  
}


