
void setup()

{
  size(450, 450);
  background(0,0,0);
  for(int j = 0; j<5; j++)
  {
    float yPos = 400 - 100 * j;
    for (int i = 0; i<5; i++)
    {
     float xPos = 0 + 100 * i;
     fill(255,255,255);
     rect(xPos, yPos, 50, 50);  
    }
    
  }
  
     for(int j = 0; j<5; j++)
  {
    float yPos = 350 - 100 * j;
    for (int i = 0; i<4; i++)
    {
     float xPos = 50 + 100 * i;
     fill(255,255,255);
     rect(xPos, yPos, 50, 50);  
    }
    
  }
     
    
  }
