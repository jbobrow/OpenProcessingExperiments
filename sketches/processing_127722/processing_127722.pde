
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
 
void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  rectMode(RADIUS);
}
 
void draw()
{
  backgroundColor();
  if (xpos.size() < 5)
  {
    fill(155,255,200);
  }
  else if ((xpos.size() >= 5) && (xpos.size() < 11))
  {
    fill(255);
  }
  else if ((xpos.size() >= 11) && (xpos.size() < 16))
  {
    fill(0,0,255);
  }
  else
  {
    backgroundColor();
    for (int j = (xpos.size() - 1); j >= 0; j--)
    {
        xpos.remove(j);
        ypos.remove(j);
    }
  }
  for (int i = 0; i < xpos.size() ; i++)
  {
    if (i % 2 == 0)
    {
      rect(xpos.get(i),ypos.get(i),radius,radius);
    }
    else
    {
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    else if (xpos.get(i) < 0)
    {
      xpos.set(i,height);
    }
    else if (ypos.get(i) > height)
    {
      ypos.set(i,0);
    }
    else if (ypos.get(i) < 0)
    {
      ypos.set(i, width);
    }
  }
  for (int k = 0; k <= (xpos.size() - 1); k++)
  {
    stroke(0,255,0);
    for (int l = 0; l <= (xpos.size() - 1);l++)
    {
      line(xpos.get(k), ypos.get(k), xpos.get(l), ypos.get(l));
    }
    stroke(255);
  }
}

void mouseClicked()
{
  if (mouseButton == LEFT)
  {
    if (xpos.size() <= 7)
    {
      if (xpos.size() <= 3)
      {
        yvelocity.add(xpos.size());
      }
      else
      {
        yvelocity.add((xpos.size() - 4) * -1);
      }
    }
    else
    {
      xvelocity.add(int(random(-6,6)));
      yvelocity.add(int(random(-6,6)));
    }
    if (xpos.size() % 2 == 0)
    {
      xvelocity.add(1);
    }
    else
    {
      xvelocity.add(-1);
    }
    xpos.add(mouseX);
    ypos.add(mouseY);
  }
  else if (mouseButton == RIGHT)
  {
    for (int i = 0; i <= (xpos.size() - 1); i++)
    {
      if ((abs(mouseX - xpos.get(i)) <= radius) && (abs(mouseY - ypos.get(i)) <= radius))
      {
        xpos.remove(i);
        ypos.remove(i); 
        xvelocity.remove(i);
        yvelocity.remove(i);
      }
    }
  }
}

void backgroundColor()
{
  if (xpos.size() % 7 == 0)
  {
  background(255);
  }
  else
  {
    background(0);
  }
}
