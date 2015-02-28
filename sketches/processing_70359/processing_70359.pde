
//Derek Chan, Functions and Animation, CP1 Mods 14-15
//http://derek-lhs.webs.com/BouncingColorChange.html

float x = 0;
float y = 200;
float widthHeight = 0;
float large = 0;
boolean activateLarge =true;
void setup()
{
  background(0,0+y,255-x);
  size(400, 400);
  frameRate(50);
  smooth();
  strokeWeight(5);
  stroke(255);
}
void draw()
{
  if (!activateLarge)
  {
    large = large + .1;
  }
  bounceDownUp();
  bounceUpDown();
  fill(255-x,0+y,0);
  ellipse(200,200,x,y);
}
void bounceDownUp()
{
  if (x<200)
  {
    activateLarge = !activateLarge;
     background(0,0+y,255-x);
    x = x + 2;
    y = y + 2;
    fill(255, 0, 0);
    ellipse(x, y, 50+large, 50+large);
  }
  if (x>199)
  {
     background(0,0+y,255-x);
    fill(0, 0, 255);
    ellipse(x, y, 50+large, 50+large);
    x = x + 2;
    y = y - 2;
  }
}
void bounceUpDown()
{
  if (y<199)
  {
     background(0,0+y,255-x);
    fill(0, 255, 0);
    ellipse(x, y, 50+large, 50+large);
    x = x - 4;
  }
  if (x<201&&y<201)
  {
     background(0,0+y,255-x);
    fill(255, 255, 0);
    ellipse(x, y, 50+large, 50+large);
    x = x - .5;
    y = y + .5;
  }
}
