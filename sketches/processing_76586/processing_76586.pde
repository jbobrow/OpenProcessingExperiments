
//Christopher Chan
//Assignment 8
//Code written on October 18th, 2012

float x, y, a, b, mX;
color col;

void setup ()
{
  size (400, 400);
  smooth ();
  background (#FFFFFF);
  frameRate (10);
  noStroke ();
  rectMode (CENTER);

  a=30;
  b=30;
  x=50;
  y=100;
  mX=1;
}

void draw ()
{
  for (float y=50; y < 400; y = y+50)
  {
    fill (-mouseX*mX, -mouseX*mX, mouseX*mX, mouseY);
    grid (y);
    fill (mouseX*mX, -mouseX*mX, -mouseX*mX, mouseY);
    grid (y);
  }
  draft ();
}

void grid (float y2)
{
  for (float x=50; x < 400; x = x+50)
  {
    noStroke ();
    rect (x, y2, 40, 40);
  }
}

void draft()
{
  while (a < 370)
  {
    stroke (0, 60);
    line (a, 0, a, height);
    a=a+40;
    line (a, 0, a, height);
    a=a+10;
  }
  while (b < 370)
  {
    stroke (0, 60);
    line (0, b, width, b);
    b=b+40;
    line (0, b, width, b);
    b=b+10;
  }
}

void keyPressed ()
{
  if (key == ' ')
  {
    mX=mX*-1;
  }
}


