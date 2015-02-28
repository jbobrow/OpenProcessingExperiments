
color strokeColor, fillColor;
PVector ellipsePos, ellipseSize, ellipseSpeed;

void setup()
{
  strokeColor = color(255,255,0);
  fillColor = color(0,192,0);
  ellipsePos = new PVector(0,0);
  ellipseSize = new PVector(50,50);
  ellipseSpeed = new PVector(1,1);
  
  size(400,400);
}

void draw()
{
  background(0,0,0);
  ellipsePos.x = ellipsePos.x+ellipseSpeed.x+random(-2,2);
  ellipsePos.y = ellipsePos.y+ellipseSpeed.y+random(-2,2);
  drawEllipse(strokeColor, fillColor, ellipsePos, ellipseSize);
}

void drawEllipse(color strClr, color flClr, PVector elPos, PVector elSize)
{
  stroke(strClr);
  fill(flClr);
  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}


