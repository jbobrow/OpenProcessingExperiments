
void setup()
{
  smooth();
  size(500, 500);
  background(0, 0, 0);
  noStroke();
}

void draw()
{
  for(int i = 1; i < 5; i++)
  {
    for(int j = 1; j < 5; j++)
    {
       drawTarget(100 * i, 100 * j);
    }
  }
}

void drawTarget(int x, int y)
{
  smooth();
  int c = 255;
  
  for(int i = 80; i > 0; i -=8)
  {
     if(c == 31) c = 255;
     else c = 31;
     fill(255, c, c);
     ellipse(x, y, i, i);
  }
} 
                
                
