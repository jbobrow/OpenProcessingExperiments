
float x, y, wd, ht, xSpeed;
float tx, ty, twd, tht, txSpeed;
 
void setup ()
{
  smooth ();
  background (0, 0, 0);
  size (400, 400);
 
 // x=random(width);
  //y= random(height);
  //wd= random(width);
 // ht=random(height);
 xSpeed=2;
 
  
  tx=0;
  ty= random(height);
  twd= 100;
  tht= 100;
  txSpeed=4;
  strokeWeight (10);
  stroke (255, 0, 0);
  fill (255, 255, 255);
 
}
 
void draw ()
{
  background (0, 0, 0);
moveTarget();
drawTarget (x, y, wd, ht);
moveTarget2();
drawTarget2 (tx, ty, twd, tht);
}
 
 
  void moveTarget ()
{
  x=xSpeed+x;
  if (x > width + 50)
  {
    xSpeed=-xSpeed;
    x=random(width);
    y= random(height);
    wd= random(width);
    ht=random(height);
  }
  else if (x< 90 )
  {
    xSpeed=-xSpeed;
    x=random(width);
    y= random(height);
    wd= random(width);
    ht=random(height);
  }
}
 
void drawTarget (float x, float y, float wd, float ht)
{
 fill(255,255,255);
 stroke(255,0,0);
 strokeWeight(10);
  ellipse(x,y,100,100);
}
 
void moveTarget2 ()
{
  tx=txSpeed+tx;
  if (tx > width)
  {
    tx=0;
    tx=-twd*.5;
  }
}
 
void drawTarget2 (float x, float y, float wd, float ht)
{
 noFill();
 stroke(255,0,0);
 strokeWeight(10);
 ellipse(x,y,150,150);
}


