
int limit=1;
void setup()
{
  size(500,500);
  translate(-200,200);
  frameRate(1);
}
void draw()
{
  background(0);
   int x = 1;
  while (x<=limit)
  {
    ellipse(int(random(100,400)), int(random(100,400)),20,20);
    x++;
  }
  limit=2*limit;
  if (x>100)
  {
    limit=1;
    x=1;
  }
  
}
