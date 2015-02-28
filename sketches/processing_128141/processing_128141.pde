
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
}
  
void draw()
{
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    rectMode(CENTER);
    if (ypos.size() <= 5)
    {
      fill(100);
      ellipse(xpos.get(i),ypos.get(i),40,40);
    }
    if (ypos.size() > 5 && ypos.size() <= 10)
    {
      if (ypos.size() % 2 == 0)
      {
        fill(250);
      rect(xpos.get(i),ypos.get(i),40,40);
      }
      else
      {
        if (ypos.size() % 7 == 0)
        {
          background(250);
          fill(250);
          ellipse(xpos.get(i),ypos.get(i),40,40);
        }
        else
        {
          background(0);
          fill(250);
          ellipse(xpos.get(i),ypos.get(i),40,40);
        }
      }
    }
     if (ypos.size() > 10 && ypos.size() < 15)
    {
      if (ypos.size() % 2 == 0)
      {
        fill(155,255,200);
      rect(xpos.get(i),ypos.get(i),40,40);
      }
      else
      {
        if (ypos.size() % 7 == 0)
        {
          background(250);
          fill(155,255,200);
          ellipse(xpos.get(i),ypos.get(i),40,40);
        }
        else
        {
            background(0);
            fill(155,255,200);
            ellipse(xpos.get(i),ypos.get(i),40,40);
        }
      }
    }
      if (ypos.size() == 15)
      {
        xpos.clear();
        ypos.clear();
      }
  }
}
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}
