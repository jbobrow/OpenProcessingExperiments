
void setup()
{
  size(850, 850);
  background(12, 60, 100);
}

void draw()
 
{
  noStroke();
  fill(255, 237, 98);
  for (int i = 0; i <10; i++)
  {
    for (int j = 0; j <10; j++)
    {
      star(i*100 - 50, j*100 - 50);
    }
  } 
}

void star(int x, int y)
{
  triangle(x+0, y+10, x+40, y+10, x+20, y+35);
  triangle(x+0, y+25, x+40, y+25, x+20, y+0); 
}
