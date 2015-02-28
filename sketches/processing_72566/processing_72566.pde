
//Eric Trinh, RandomWalk, CP1 mods 16-17
//url: http://ericsprogrammingsite.host22.com/RandomWalk.html

int r = 0;
int x = 200;
int y = 200;
void setup()
{
  size(400, 400);
  smooth();
  background(255);
  strokeWeight(2);
  frameRate(24);
}
void draw()
{
  fill(255,255,255,20);
  rect(0,0,400,400);
  r = int(random(255));
  int direction = int(random( -4, 3));
  fill(r, 20, 100);
  rect(x, y, 25, 25);
  rect(y,x,x,y);
  rect(x,y,-y,-x);
  if ( direction == -3)
  {
    x = x + 8;
  }
  if ( direction == -2)
  {
    x = x - 8;
  }
  if ( direction == -1)
  {
    y = y + 8;
  }
  if ( direction == 0)
  {
    y = y - 8;
  }
  if ( direction == 1)
  {
    x = -x;
  }
  if (direction == 2)
  {
    y = -y;
  }
  while(x>400)
  {
    x = -x;
  }
  while(x<0)
  {
    x = -x;
  }
  while(y>400)
  {
    y = -y;
  }
  while(y<0)
  {
    y = -y;
  }
}
