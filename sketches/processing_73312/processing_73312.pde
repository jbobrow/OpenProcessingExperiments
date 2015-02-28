

void setup()
{
  size(500,500);
  background(255);
}

void draw() 
{
  fill(89,277,207);
  drawPoly(20,250,250,60);
}

void drawPoly(int sides, int centerX, int centerY, int vdist)
{
  beginShape();
    for (int i = 0; i < sides; i++)
    {
      float angle = 360 / sides;
      
      if(i%2==0)
      {
        vertex(centerX + vdist * cos(radians(angle * i)),centerY + vdist * sin(radians(angle * i)));
      }
      else
      {
        vertex(centerX + vdist/2 * cos(radians(angle * i)),centerY + vdist/2 * sin(radians(angle * i)));
      }
    }
  endShape(CLOSE);
}

