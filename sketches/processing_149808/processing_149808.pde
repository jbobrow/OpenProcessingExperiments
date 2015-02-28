
float x, y, xSpeed, ySpeed, a;

void setup ()
{
  size (400, 400);
  background (0);
  x= 0;
  y=0;
  xSpeed=1;
  ySpeed=5;
  a= -ySpeed/100;
  //a=-1;
  //a=-.09;
  
}

void draw()
{
  ellipse (x, y, 5, 5); 

  x=x+xSpeed;
  y=y+ySpeed;
  ySpeed=ySpeed+a;

  if (y<0)
  {
    ySpeed= -ySpeed;
  }

  if (x>width || x<0)
  {
    xSpeed = -xSpeed;
  }

  // stops drawing after 1 iterations

  //  if (y<0)
  //  {
  //    y=0;
  //    a=0;
  //    ySpeed= 0;
  //    xSpeed=0;
  //  }
  println(y);
}



