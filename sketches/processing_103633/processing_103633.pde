
int counter = 0;
void setup() {
  size(450, 450);
  frameRate(20);
  background (0, 0, 0);
  
}

void draw ()
{
  
  
  for (int j = 0; j < 5; j++)
  {
    for (int i = 0; i < 5; i++)
    {
      float xPos = 100 * i;
      float yPos = 100 * j;
      rect(xPos, yPos, 50, 50);

    }
  }
  

  fill(255, 255, 255);
  for (int j = 0; j < 4; j++)
  {
    for (int i = 0; i < 4; i++)
    {
      float xPos = 50 + 100 * i;
      float yPos = 50 + 100 * j;
      rect(xPos, yPos, 50, 50);
      
    }
  }

}
