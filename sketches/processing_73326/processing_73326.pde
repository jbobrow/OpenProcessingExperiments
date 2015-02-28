
void setup()
{
  size(500,500);
  background(0);
  fill(255);
  smooth();
}

void draw()
{
  polygon(10, 250, 250, 100);
}

void polygon(int sideCount, int xCenter, int yCenter, int distance)
{
  
  float angle = 360/sideCount;
  
  beginShape();
  
    float posX;
    float posY;
    
  for(int i=0; i <= sideCount; i++)
  {
    
    posX = xCenter + distance * cos (radians(angle*i));
    posY = yCenter + distance * sin (radians(angle*i));
    vertex(posX, posY);
  }
  
  endShape();
}
