
void setup()
{
  background(0, 0, 0);
  size(500, 500);
  smooth();
  noStroke();
}

int column = 9;
int row = 9;

void draw()
{
  for(int y = 0; y<column; y+=1)
    {
  for(int x = 0; x<column; x+=1)
  {
   
          fill(104-(x*10), 237-(x*10)-(y*10), 222-(x*10)-(y*10));
          ellipse((x*55),50+(y*50), x*4, x*4);

    }
  }
}               
