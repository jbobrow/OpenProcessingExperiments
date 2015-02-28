
// © Julia Shen
// yuans @ andrew.cmu.edu

// press x to speed up vertical snowflake
// press y to slow down vertical snowflake
// press a, s, d, f to change speed of bouncing snowflake

float bx, by, bd, bxSpeed, bySpeed;
float wx, wy, wd, wxSpeed, wySpeed;

PImage snow1, snow2;

void setup()
{
 size (400, 400);
 background (171, 237, 255);
 
 bx = random(width);
 by = random(height);
 bd = 100;
 bxSpeed = 2;
 bySpeed = 2;
 
 wx = random(100, 300);
 wy = random(height);
 wd = 100;
 wxSpeed = 2;
 wySpeed = 3;
  
  snow1 = loadImage("snowflake1.png");
  snow2 = loadImage("snowflake2.png");
  imageMode (CENTER); 


}

void draw()
{
  background (118,220, 255);
 moveWrap();
moveBounce();
drawWrap(wx, wy, wd);
drawBounce(bx, by, bd);
}

// wrap, snow1

void drawWrap(float wx, float wy, float wd)
{
  image (snow1, wx, wy, wd, wd);
}

void moveWrap()
{ 
  wy = wy + wySpeed;
  if (wy>height + 50)
  {wy = -height;}
}



// bounce, snow2
  

void drawBounce(float bx, float by, float bd)
{
  image (snow2, bx, by, bd, bd);
}

void moveBounce()
{
  bx = bx + bxSpeed;
  if (bx>width)
  {bxSpeed = -bxSpeed;}
  else if (bx<0)
  {bxSpeed = -bxSpeed;}
  
  by = by + bySpeed;
  if (by>height)
  {bySpeed = -bySpeed;}
  else if (by < 0)
  {bySpeed = -bySpeed;}
  }
  
void keyPressed()
{ 
  if (key == 'x')
  {wySpeed ++;}
  if (key == 'y')
  {wySpeed --;}
  if (key == 'a')
  {bxSpeed ++;}
  if (key == 's')
  {bySpeed ++;}
  if (key == 'd')
  {bxSpeed --;}
  if (key == 'f')
  {bySpeed --;}
}


