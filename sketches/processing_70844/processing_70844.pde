
//Robert Wohlforth  rwohlfor
//Homework 6 - MiniGolf
//Copyright Pittsburgh 2012

//Hold down the mouse to aim the ball. 
//Pull back to increase the force of the shot.
//Release the mouse to make the shot.
//Try bouncing the ball into the hole.
//Clicking on the ball stops it.

float x = 300;
float y = 300;
float deltaX;
float deltaY;
float ballWidth = 25;
float t = 20;
float arcStart = -PI/2;
float arcEnd = PI/2;
float targetX = random(100+ballWidth/2,500-ballWidth/2);
float targetY = random(100+ballWidth/2,500-ballWidth/2);

void setup()
{
size (600, 600);
background (0);
fill (#29B748);
rect (100,100,400,400);
}

void draw()
{
  background (0);
  fill (#29B748);
rect (100,100,400,400);
  clubLine();
  drawFigure ();
  moveFigure ();
  rolling ();
  friction();
  bounce ();
  stop();
  collision();
}

void clubLine()
{
  if(mousePressed == true)
  {
  stroke(#FFFFFF);
  line (x, y, mouseX, mouseY);
  }
}

void mouseReleased()
{
  deltaX = (x - mouseX)/66;
  deltaY = (y - mouseY)/66;
}

void drawFigure()
{
  noStroke();
  fill (#7FB78B);
  ellipse (x-5, y-5, ballWidth, ballWidth);
  fill (0);
  ellipse (targetX, targetY, ballWidth, ballWidth);
  fill (#FFFFFF);
  stroke (#A6A7A6);
  ellipse (x, y, ballWidth, ballWidth);
  stroke (#A6A7A6);
  noFill();
  translate(x,y);
  if (deltaY < 0 && deltaX > 0)
  {rotate(PI/2 - tan(deltaY/deltaX));
  }
  if (deltaY < 0 && deltaX < 0)
  {rotate(PI - tan(deltaY/deltaX));
  }
  if (deltaY > 0 && deltaX > 0)
  {rotate(-PI/2 + tan(deltaY/deltaX));
  }
  if (deltaY > 0 && deltaX < 0)
  {rotate(-PI + tan(deltaY/deltaX));
  }
  arc (0, 0, t, ballWidth, arcStart, arcEnd);
}

void moveFigure()
{
  x = x + deltaX;
  y = y + deltaY;
}

void rolling ()
{
  if (arcStart < 0)
  {
  t = t + abs(sqrt(sq(deltaX)+sq(deltaY)));
  if (t > ballWidth)
  {arcStart = PI/2;
  arcEnd = 1.5 * PI;
  }
  }
  else if (arcStart > 0)
  {
    t = t - abs(sqrt(sq(deltaX)+sq(deltaY)));
  if (t < 0)
  {arcStart = -PI/2;
  arcEnd = PI/2;
  }
}
}

void bounce ()
{
  if (x > width-100-ballWidth/2 || x < 100+ballWidth/2)
  {
    deltaX = -deltaX;
    deltaX = deltaX * 0.6;
    if (x < 100+ballWidth/2)
    {
    x = 101+ballWidth/2;
  }
    else 
    {x = width-101-ballWidth/2;
  }
  }
  if (y > width-100-ballWidth/2 || y < 100+ballWidth/2)
  {
    deltaY = -deltaY;
    deltaY = deltaY * 0.6;
    if (y < 100+ballWidth/2)
    {y = 101+ballWidth/2;
  }
    else 
    {y = width-101-ballWidth/2;
  }
  }
}

void friction ()
{
deltaX = deltaX * 0.9999;
deltaY = deltaY * 0.9999;
}

void stop ()
{
  if( abs(deltaX) < 0.5 && abs(deltaY) < 0.1)
{
deltaX = 0;
deltaY = 0;
}
}

void collision ()
{
  if (sqrt(sq(x-targetX)+sq(y-targetY))-5 < ballWidth/2)
  {x = targetX;
  y = targetY;
  //deltaX = 0;
  //deltaY = 0;
  targetX = random(100+ballWidth/2,500-ballWidth/2);
  targetY = random(100+ballWidth/2,500-ballWidth/2);
  }}
  

  


