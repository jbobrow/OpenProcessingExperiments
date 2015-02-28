

void setup()
{
  size(600,600);
  
}
 
void draw ()
{
 background(0);
 for(int i = 0; i <= height; i = i+10)
    {
      for(int j = 0; j <= width; j = j+10)
      {
         ellipse(i,j,i + 10,j + 10);
      }
    }
}


