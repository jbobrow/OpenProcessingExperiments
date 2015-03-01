
void setup()
{
  size(500, 500);
}
  
void draw()
{
  for (int x = 0; x < width; x += 20)
  {
      float cx = x + 20;
    for (int y = 0; y < height; y += 20) 
    {
      float cy = y + 20;   
      int c = 255;
      fill(25,100,45);
      rect(x,y,20-1,20-1); 
    }
  }
}
