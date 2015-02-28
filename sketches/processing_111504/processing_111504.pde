
void setup()
{
  size(500, 500);
}

void draw()
{
  background(255);
  for (int i=1; i<4000; i++)
  {
    
    float posX1 = random(90, width-90);
    float posY1 = random(90, height-90);
    float posX2 = random(90, width-90);
    float posY2 = random(90, width-90);
    stroke(0);
    line(posX1, posY1, posX2, posY2);
  }
}



