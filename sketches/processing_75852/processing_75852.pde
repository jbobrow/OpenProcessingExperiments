
//Jenny H. CP1 mods 14/15, Doubling Shapes
int count = 0;
int limit = 1;
void setup ()
{
  size (300, 300);
  frameRate(1);
}
void draw ()
{
  background (255);

  while (count < limit)
  {

    int x = int(random (0, 301));
    int y = int(random (0, 301));

    //head
    fill (13, int(random (204, 256)), int(random (123, 256)));
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
  limit = limit * 2;
  fill (255, 0, 0);
  textSize (20);
  text (count/2, 50, 50);
  fill (255, 255, 255, 5);
  rect (40, 20, 60, 30);

  if (limit > 2048)
  {
    count = 0;
    limit = 1;
  }
}
