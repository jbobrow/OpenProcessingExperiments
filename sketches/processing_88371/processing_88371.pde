
// homework 6, 51-257, suzanne choi, suzanne1
// copyrights 2013 suzanne choi. all rights reserved.

//press 'a' = making plain rabbit move faster in horizontal direction
//press 's' = making plain rabbit move slower in horizontal direction
//press 'd' = making plain rabbit move faster in vertical direction
//press 'f' = making plain rabbit move slower in vertical direction
//press 'j' = making superman rabbit move faster in horizontal direction
//press 'k' = making superman rabbit move slower in horizontal direction
//press 'l' = making superman rabbit move faster in vertical direction
//press ';' = making superman rabbit move slower in vertical direction


float bx, by, bd, bxSpeed, bySpeed;
float wx,wy,wd, wxSpeed, wySpeed;
PImage bounce;
PImage wrap;

void setup()
{
  size(400,400);
  bx = 100;
  by = 30;
  bd = 130;
  bxSpeed = 2;
  bySpeed = 3;
  wx = random(width);
  wy = random(height);
  wd = 100;
  wxSpeed = 3;
  wySpeed = 4;  
  
  bounce=loadImage("bounce.png");
  wrap=loadImage("wrap.png");
}

void draw()
{
  background(250,146,174);
  smooth();
  
  moveWrap();
  moveBounce();
  drawBounce(bx,by,bd);
  drawWrap(wx,wy,wd);
}

void drawBounce(float bx, float by, float bd)
{
  image (bounce, bx,by,bd,bd);
}

void moveBounce()
{
  bx=bx+bxSpeed;
  if(bx>width*.75)
  {bxSpeed=-bxSpeed;}
  else if (bx<0)
  {bxSpeed=-bxSpeed;}
  
  by=by+bySpeed;
  if(by>height*.75)
  {bySpeed=-bySpeed;}
  else if (by<0)
  {bySpeed=-bySpeed;}
}

void moveWrap()
{
 wx=wx+wxSpeed;
if (wx> width)
{wx=-width+wd*.55;}

wy=wy+wySpeed;
if (wy>height)
{wy=-height+wd*.55;}
 
}
void drawWrap(float wx, float wy, float wd)
{
image (wrap, wx,wy,wd,wd);
}


void keyPressed()
{
  if (key == 'a')
  {wxSpeed ++;}
  
  if (key == 's')
  {wxSpeed --;}
  
  if (key == 'd')
  {wySpeed ++;}
  
  if (key == 'f')
  {wxSpeed --;}
  
  if (key == 'j')
  {bxSpeed ++;}
  
  if (key == 'k')
  {bxSpeed --;}
  
  if (key == 'l')
  {bySpeed ++;}
  
  if (key == ';')
  {bySpeed --;}
}






