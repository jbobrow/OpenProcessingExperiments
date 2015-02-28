
//Michelle Guarino, mguarino@andrew.cmu.edu
//copywrite. all rights reserved.

float x, y, wd, ht, xSpeed;
float tx, ty, twd, tht, txSpeed;


void setup ()
{
  smooth ();
  background (16, 98, 173);
  size (400, 400);
  //initial values for float

  x=random(width);
  y= random(height);
  wd= random(width);
  ht=random(height);
  xSpeed=2;

 
  tx=0;
  ty= random(height);
  twd= 60;
  tht= 60;
  txSpeed=2;
  strokeWeight (0);
  stroke (249, 249, 117);
  fill (249, 249, 117);

}

void draw ()
{
  background (16, 98, 173);
moveTarget();
drawTarget (x, y, wd, ht);
  moveTarget2();
  drawTarget2 (tx, ty, twd, tht); 
}





  void moveTarget ()
{
  x=xSpeed+x;
  if (x > width-30)//too far right
  {
    xSpeed=-xSpeed;//then more left
    x=random(width);
    y= random(height);
    wd= random(width);
    ht=random(height);
  }
  else if (x< 90 ) //too far left
  {
    xSpeed=-xSpeed;//then move right
    x=random(width);
    y= random(height);
    wd= random(width);
    ht=random(height);
  }
}

void drawTarget (float x, float y, float wd, float ht)
{
  quad (x+wd*.045, y+ht*.20, x+wd*.055, y-ht*.20, x+wd*.105, y-ht*.20, x+wd*.105, y+ht*.20);
  quad (x-wd*.045, y-ht*.20, x-wd*.055, y+ht*.20, x-wd*.105, y+ht*.20, x-wd*.105, y-ht*.20);
  quad (x-wd*.245, y-ht*.20, x-wd*.255, y+ht*.20, x-wd*.305, y+ht*.20, x-wd*.305, y-ht*.20);
  quad (x-wd*.255, y+ht*.01, x-wd*.255, y-ht*.01, x-wd*.105, y-ht*.01, x-wd*.105, y+ht*.01);
}

void moveTarget2 ()
{
  tx=txSpeed+tx;
  if (tx > width)//is the target too far to the right?
  {
    tx=0; //move it back to the left side
    tx=-twd*.50;
  }
}

void drawTarget2 (float x, float y, float wd, float ht)
{
  quad (x+wd*.045, y+ht*.20, x+wd*.055, y-ht*.20, x+wd*.105, y-ht*.20, x+wd*.105, y+ht*.20);
  quad (x-wd*.045, y-ht*.20, x-wd*.055, y+ht*.20, x-wd*.105, y+ht*.20, x-wd*.105, y-ht*.20);
  quad (x-wd*.245, y-ht*.20, x-wd*.255, y+ht*.20, x-wd*.305, y+ht*.20, x-wd*.305, y-ht*.20);
  quad (x-wd*.255, y+ht*.01, x-wd*.255, y-ht*.01, x-wd*.105, y-ht*.01, x-wd*.105, y+ht*.01);
}



