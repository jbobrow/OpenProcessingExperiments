
void setup()
{
  size(800, 800);
  
  stroke(255);
  
  strokeWeight(4);
}


void draw()
{
  background(0);
  
  translate(width/2, height/2);
  
  int points = (int)(millis()/100.0);

  for(int i = 0; i < points; i++)
  {
    float m = (millis() * (points-i)) / 1000.0;
    
    float r = 10.0 + ((float)i / (float)points) * (width/2);
    
    float xPos = sin(m) * r;
    float yPos = cos(m) * r;
 
    point(xPos, yPos);
  }
}
