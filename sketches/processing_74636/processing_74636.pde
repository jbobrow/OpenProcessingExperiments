
//Jenny H. CP1 mods 14/15, 100 Random Shapes
void setup ()
{
  size (400, 400);
  frameRate(1);
}
void draw ()
{
  background (255);
  int count = 1;
  while (count <= 100)
  {
    int x = int(random (0, 401));
    int y = int(random (0, 401));
    
    //head
    fill (13, int(random (204, 256)), int (random (123, 256)));
    stroke (0);
    ellipse (x, y, 30, 30);
    
    //eyes
    fill (255);
    ellipse (x-5, y-5, 10, 10);
    ellipse (x+5, y-5, 10, 10);
    fill (0);
    ellipse (x-4, y-5, 5, 5);
    ellipse (x+4, y-5, 5, 5);
    
    //smile
    stroke (0);
    arc (x, y+3, 20, 20, 0, PI);
    count ++;
  }
}
