
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;
 
void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  rectMode(RADIUS);
}
 
void draw()
{
  if (xpos.size() % 7 == 0)
  {
    background(255);
  }
  else
  {
    background(0);
  }
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
    if (xpos.size() % 7 == 0)
    {
      background(255);
    }
    else
    {
      background(0);
    }
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
    else if (i % 2 == 1)
    {
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
  }
  if (xpos.size() > 1)
  {
    for (int k = 0; k < (xpos.size() - 1); k++)
    {
      stroke(0,255,0);
      for (int l = 0; l < (xpos.size() - 1);l++)
      {
        line(xpos.get(k), ypos.get(k), xpos.get(l), ypos.get(l));
      }
      stroke(255,255,0);
      line(xpos.get(k), ypos.get(k), xpos.get(k+1), ypos.get(k+1));
      stroke(255);
    }
  }
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}

