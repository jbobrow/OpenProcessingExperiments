
int radi=60;
int curse=40;
float a, b;
float x, y;
float xspeed = 2.8;  // Speed of the shape
float yspeed = 2.2;  // Speed of the shape
float aspeed = 5.4;
float bspeed = 2.4;

int adirection = 2;
int bdirection = 1;
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom

void setup()
{
  size (800, 500);
  noStroke();
  frameRate(105);
  ellipseMode(RADIUS);
}
void draw()
{
  who();
  cub();
}
void who()
{
  x = x + ( xspeed * xdirection );
  y = y + ( yspeed * ydirection );
  background(0);
  ellipse(x, y, radi, radi);


  if (y>500)
  {
    ydirection=-10;
  }
  if (x>800)
  {
    xdirection=-2;
  }
  if (y<0)
  {
    ydirection=12;
  }
  if (x<0)
  {
    xdirection=5;
  }
}
void cub()
{
  a = a + ( aspeed * adirection );
  b = b + ( bspeed * bdirection );
  fill(155, 58, 165);
  ellipse(a, b, curse, curse);
  if (a>800)
  {
    aspeed=-10;
  }

  if (b>500)
  {
    bspeed=-5;
  }
  if (a<0)
  {
    aspeed=15;
  }
  if (b<0)
  {
    bspeed=5;
  }
}
