
// Josh Newby  jnewby@andrew.cmu.edu  Copyright Josh Newby 2013
// This program makes a bunch of balls bounce and glide across the screen
// homeowork # 6

float bx, by, px, py, speed, ax, ay, cx, cy, aspeed, a, b, c, d, bspeed;

void setup()
{
  size (400, 400);
  background (0, 0, 0);
  noStroke();
  smooth();
  
  //ball1
  bx = 200;
  by = 200;
  px = 20;
  py = 20;
  speed = 4;
  
  //ball2
  ax = 200;
  ay = 200;
  cx = 20;
  cy = 20;
  aspeed = 4;
  
  //ball3
  a = 200;
  b = 200;
  c = 20;
  d = 20;
  bspeed = 4;
}

void draw()
{
  prep();
  ball1(bx, by, px, py);
  ball1(bx + 50, by, px, py);
  ball1(bx - 50, by, px, py);
  ball1(bx + 100, by, px, py);
  ball1(bx -100, by, px, py);
  bounce1();
  ball2(ax, ay + 50, cx, cy);
  ball2(ax, ay - 50, cx, cy);
  ball2(ax, ay + 100, cx, cy);
  ball2(ax, ay - 100, cx, cy);
  ball2(ax, ay, cx, cy);
  bounce2();
  ball3 (a, b, c, d);
  orbit1();
}

void orbit1()
{
  a = a + bspeed;
  if (a >= width)
  {
    a = 0;
  }
  b = b + bspeed;
  if (b >= height)
  {
    b = 0;
  }
}

void ball3 (float a, float b, float c, float d)
{
  fill (25, 150, 0);
  ellipse (a, b, c, d);
}

void prep()
{
  fill (0, 0, 0, 15);
  rect (-1, -1, width + 1, height + 1);
}

void ball1 (float bx, float by, float px, float py)
{
  fill (150, 0, 0);
  ellipse (bx, by , px, py);
}

void bounce1()
{
  by = by + speed;
  if (by >= height)
  {
    speed = -speed;
  }
  else if (by <= 0)
  {
    speed = -speed;
  }
}

void ball2 (float ax, float ay, float cx, float cy)
{
  fill (0, 25, 250);
  ellipse (ax, ay , cx, cy);
}

void bounce2 ()
{
  ax = ax + aspeed;
  if (ax >= width)
  {
    aspeed = -aspeed;
  }
  else if (ax <= 0)
  {
    aspeed = -aspeed;
  }
}
