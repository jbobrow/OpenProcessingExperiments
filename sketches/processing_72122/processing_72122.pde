
//Bozhong H. Ticklish Pengiun Comp 1 Mods 14-15
int x=50;
int y=50;
int randomx=int(random(100));
int randomy=int(random(100));
void setup()
{
  size(100, 100);
  background(255);
  frameRate(60);
}
void draw()
{
  snake();
}
void snake()
{
  fill(100);
  ellipse(randomx, randomy, 10, 10);
  fill(100, 155, 255, 100);
  rect(0, 0, 99, 99);
  fill(0);
  rect(x, y, 15, 15);
  int direction=int(random(0, 4));
  if (direction==0)
  {
    x=x+10;
  }
  else if (direction==1)
  {
    x=x-10;
  }
  else if (direction==2)
  {
    y=y+10;
  }
  else
  {
    y=y-10;
  }
  if (x<0)
  {
    x=x+30;
  }
  if (y>100)
  {
    y=y-30;
  }
  if (x>100)
  {
    x=x-30;
  }
  if (y<0)
  {
    y=y+30;
  }
  if (get(randomx,randomy)==color(0))
  {
    randomx=int(random(100));
    randomy=int(random(100));
  }
}
