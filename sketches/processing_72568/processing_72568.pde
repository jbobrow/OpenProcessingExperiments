
//Eric K, Line Patterns

/*
  Makes line patterns.
  Click on the applet to plot vertex points.
  
  Press the spacebar to reset.
  Press "c" for color.
  Press "f" for a fading effect.
  Press "r" for a random, continuous animation.
  You can change the amount of lines drawn in an iteration using "+" for more and "-" for less.
*/

boolean isDrawing = false;
boolean hasColor = false;
boolean isRandom = false;
boolean fades = false;
int x1;
int y1;
int x2;
int y2;
int x3;
int y3;
int c;
int i = 0;
int t = 20;
int mouseClicks = 0;
void setup()
{
  size(600, 600);
  background(0);
  colorMode(HSB, 100);
  stroke(0, 0, 100);
  fill(0, 0, 0, 50);
  i = 0;
  t = 20;
}
void draw()
{
  if (isRandom)
  {
    plotPoints();
  }
  if (isDrawing)
  {
    if (hasColor)
    {
      stroke(c, 100, 100);
    }
    else
    {
      stroke(c, 0, 100);
    }
    line(x1 + i*(x2-x1)/t, y1 + i*(y2-y1)/t, x2 + i*(x3-x2)/t, y2 + i*(y3-y2)/t);
    i = i + 1;
    c = c + 1;
    if (c > 100)
    {
      c = 0;
    }
    if (i > t)
    {
      isDrawing = false;
    }
  }
}
void plotPoints()
{
  if (mouseClicks < 3)
  {
    mouseClicks = mouseClicks + 1;
  }
  if (!isDrawing)
  {
    x1 = x2;
    y1 = y2;
    x2 = x3;
    y2 = y3;
    if (!isRandom)
    {
      x3 = mouseX;
      y3 = mouseY;
    }
    else
    {
      x3 = int(random(0, width));
      y3 = int(random(0, height));
    }
    point(x3, y3);
    i = 0;
    if (mouseClicks == 3)
    {
      isDrawing = true;
      if (fades)
      {
        rect(-1, -1, width+1, height+1);
      }
    }
  }
}
void mouseClicked()
{
  isRandom = false;
  plotPoints();
}
void keyPressed()
{
  if (key == ' ')
  {
    reset();
  }
  if (key == 'c')
  {
    hasColor = !hasColor;
  }
  if (key == 'r')
  {
    isRandom = !isRandom;
  }
  if (key == 'f')
  {
    fades = !fades;
  }
  if (key == '+' && t < 36)
  {
    t = t + 5;
  }
  if (key == '-' && t > 14)
  {
    t = t - 5;
  }
}
void reset()
{
  background(0);
  isDrawing = false;
  hasColor = false;
  isRandom = false;
  fades = false;
  x1 = 0;
  y1 = 0;
  x2 = 0;
  y2 = 0;
  x3 = 0;
  y3 = 0;
  i = 0;
  t = 20;
  mouseClicks = 0;
}
