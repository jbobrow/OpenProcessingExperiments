
int setSides = 5;
void setup()
{
  size(750, 500);
  background(255);
  smooth();
}

void draw()
{
  background(255);
  fill(0, 0, 0);
  drawPoly(setSides+5, mouseX, mouseY, 60);
  text("Press 3/4/5/6/7/8/9/0 to change number of sides, and move mouse to change position", 115, 480);
}

void drawPoly(int sides, int cenX, int cenY, int vertDist)
{
  beginShape();
  for (int i = 0; i < sides; i++)
  {
    float angle = 360 / sides;
    if (i%2==0) {vertex(cenX + vertDist * cos(radians(angle * i)), cenY + vertDist * sin(radians(angle * i)));}
    else {vertex(cenX + vertDist/2 * cos(radians(angle * i)), cenY + vertDist/2 * sin(radians(angle * i)));}
  }
  endShape(CLOSE);
}

void keyPressed()
{
  if ( key == '3' )
  {
    setSides = 1;
  }
  if ( key == '4' )
  {
    setSides = 3;
  }
  if ( key == '5' )
  {
    setSides = 5;
  }
  if ( key == '6' )
  {
    setSides = 7;
  }
  if ( key == '7' )
  {
    setSides = 9;
  }
  if ( key == '8' )
  {
    setSides = 11;
  }
  if ( key == '9' )
  {
    setSides = 13;
  }
  if ( key == '0' )
  {
    setSides = 15;
  }
}
