
//Christopher Chan
//ckchan@andrew.cmu.edu
//Homework 6
//(c) written on 25 Sept 2012

float x1, y1, dx1, dy1, x2, y2, dx2, dy2;
color lineColor;

void setup ()
{
  size (800, 400);
  smooth ();
  //  ellipseMode (CENTER);
  x1 = 200;
  y1 = 200;
  dx1 = 2;
  dy1 = 1;
  x2 = 200;
  y2 = 200;
  dx2 = 4;
  dy2 = 3;
  lineColor = color (0, random(150, 250), random(150, 250));
}

void draw ()
{
  crosses ();
  connection ();
  fade ();
}

void fade ()
{
  noStroke ();
  fill (#FFFFFF, 1);
  rect (0, 0, 800, 400);
}

void connection()
{
  strokeWeight(0.5);
  stroke (lineColor,80);
  x1 += dx1;
  y1 += dy1;
  x2 += dx2;
  y2 += dy2;

  //bouncing
  if (dx1>0 && x1>width)
  {
    dx1=dx1*(-1);
  }
  if (dx1<0 && x1<0)
  {
    dx1=dx1*-1;
  }   
  if (dy1>0 && y1>height)
  {
    dy1=dy1*-1;
  }
  if (dy1<0 && y1<0)
  {
    dy1=dy1*-1;
  }   

  //wrapping
  if (dx2>0 && x2>width)
  {
    x2=0;
  }
  if (dx2<0 && x2<0)
  {
    dx2=width;
  }   
  if (dy2>0 && y2>height)
  {
    y2=0;
  }
  if (dy2<0 && y2<0)
  {
    dy2=height;
  }

  line (x1, y1, x2, y2);
}

void crosses ()
{
  strokeWeight (1);
  stroke (#FFFFFF, 50);
  line (x1, 0, x1, height);
  line (x2, 0, x2, height);
  line (0, y1, width, y1);
  line (0, y2, width, y2);
}

void keyPressed ()
{
  if (key == '1')
  {
    dx1= random (5);
    dx2= random (5);
    dy1= random (5);
    dy2= random (5);
  }
  else if (key == '2')
  {
    dx1 = dx1*-1;
    dx2 = dx2*-1;
    dy1 = dy1*-1;
    dy2 = dy2*-1;
  }
  else if (key =='3')
  {
    lineColor = color (0, random(150, 250), random(150, 250));
  }
}


