
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=255;

void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}

void draw()
{
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    fill(255,c,c);
    rect(xpos.get(i),ypos.get(i),radius*3,radius*3);
    c += 1;
    c %= 255;
  }
  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      xpos.add(mouseX);
      ypos.add(mouseY);
    }
    if (mouseButton == RIGHT)
    {
      for (int i = 0; i < xpos.size(); i++)
      {
        if (abs(mouseX-xpos.get(i)) < radius)
        {
          if (abs(mouseY-ypos.get(i)) < radius)
          {
            xpos.remove(i);
            ypos.remove(i);
            break;
          }
        }
      }
    }
  }
    
  
}

