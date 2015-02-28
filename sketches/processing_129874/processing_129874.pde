
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xdot;
ArrayList<Integer> ydot;
int shapeHeight;
int tempdot;
int temppos;
int xvelocity;
int yvelocity;
boolean start;
int colorR;
int colorG;
int colorB;

//The Program begins with the outline of the triangle moving around
//the screen, the arrow keys will affect the velocity that it moves at.
//Left clicking will cease the shapes movement and form the "fractal thing".
//Right clicking will erase the triangle and it will begin to move again.

void setup()
{
  size(600,600);
  background(0);
  shapeHeight = (3*height)/5;
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xdot = new ArrayList<Integer>();
  ydot = new ArrayList<Integer>();
  xvelocity = 1;
  yvelocity = 1;
  start = false;
  xpos.add(width/2);
  ypos.add(height/5);
  xpos.add(int(xpos.get(0) + ((shapeHeight) / sqrt(3))));
  xpos.add(int(xpos.get(0) - ((shapeHeight) / sqrt(3))));
  ypos.add(int(ypos.get(0) + shapeHeight));
  ypos.add(int(ypos.get(0) + shapeHeight));
}

void draw()
{
  background(0);
  for (int l = 0; l < xpos.size(); l++)
  {
    ellipse(xpos.get(l), ypos.get(l), 5, 5);
  }
  stroke(colorR,colorG,colorB);
  fill(colorR,colorG,colorB);
  if (start == true)
  {
    findPoints();
    for (int i = 0; i < xdot.size(); i++)
    {
      point(xdot.get(i), ydot.get(i));
    }
  }
  else
  {
    checkCoords();
    for (int v = 0; v < xpos.size(); v++)
    {
      xpos.set(v, xpos.get(v) + xvelocity);
      ypos.set(v, ypos.get(v) + yvelocity);
    }
  }
}


void findPoints()
{
  for (int p = 0; p <= 1000; p++)
  {
    tempdot = int(random(0, (xdot.size())));
    temppos =int(random(0, (xpos.size())));
    xdot.add((xdot.get(tempdot) + xpos.get(temppos))/2);
    ydot.add((ydot.get(tempdot) + ypos.get(temppos))/2);
  }
}

void checkCoords()
{
  for (int i = 0; i < xpos.size(); i++)
  {
    if ((ypos.get(i) >= (height - shapeHeight)) || (ypos.get(i) <= 0))
    {
      yvelocity = yvelocity * (-1);
    }
    if ((xpos.get(i) >= width) || (xpos.get(i) < 0))
    {
      xvelocity = xvelocity * (-1);
    }
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    start = true;
    colorR = int(random(255));
    colorG = int(random(255));
    colorB = int(random(255));
    for (int i = 0; i < xpos.size(); i++)
    {
      xdot.add(xpos.get(i));
      ydot.add(ypos.get(i));
    }
  }
  else if (mouseButton == RIGHT)
  {
    start = false;
    for (int i = (xdot.size() - 1); i >= 0; i--)
    {
      xdot.remove(i);
      ydot.remove(i);
    }
    xvelocity = 5;
    yvelocity = 5;
  }
}

void keyPressed()
{
  if (keyCode == DOWN)
  {
    if (yvelocity < 10)
    {
      yvelocity += 1;
    }
  }
  else if (keyCode == UP)
  {
    if (yvelocity > -10)
    {
      yvelocity -= 1;
    }
  }
  else if (keyCode == RIGHT)
  {
    if (xvelocity < 10)
    {
      xvelocity += 1;
    }
  }
  else if (keyCode == LEFT)
  {
    if (xvelocity > -10)
    {
      xvelocity -= 1;
    }
  }
}
