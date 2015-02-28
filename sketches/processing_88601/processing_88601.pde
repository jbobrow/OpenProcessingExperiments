
public float currentColorR = 255;
public float currentColorG = 255;
public float currentColorB = 255;
void setup()
{
  size(600,600);
  
}
 
void draw ()
{
  
// background(0);
 for(int i = 0; i <= height; i = i+100)
    {
      for(int j = 0; j <= width; j = j+100)
      {
        if(random(10) >5)
        {
         currentColorR = random(255);
         currentColorG = random(255);
         currentColorB = random(255);
        }
         fill(currentColorR,currentColorG,currentColorB);
         rect(random(width-100),random(width-100),random(100),random(100));
      }
    }
}


