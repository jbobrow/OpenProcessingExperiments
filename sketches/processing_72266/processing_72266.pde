
//Victor Murillo, CP1 mods 16-17, Functions and Animations
int x = 0;
int change = 1;
void setup()
{
  size(500, 500);
  smooth();
  noFill();
  frameRate(45);
}
void draw()
{
  background(0);
  stroke(255,0,0);
  ellipse(x, x, 50, 50);
  stroke(0,255,0);
  ellipse(500-x,x,50,50);
  stroke(0,255,255);
  ellipse(250, 250, x, x);
  stroke(255,255,0);
  ellipse(250,x,50,50);
  stroke(0,0,255);
  ellipse(x,500-x,50,50);
  stroke(54,0,108);
  ellipse(x,250,50,50);
  stroke(214,107,0);
  ellipse(500-x,500-x,50,50);
  stroke(167,101,153);
  ellipse(250,250,x,40);
  x = x + change;
  if (x > 500)
  {
    change = -1;
  }
  if (x < 0)
  {
    change = 1;
  }
}
