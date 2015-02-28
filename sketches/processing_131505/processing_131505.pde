
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;

void setup()
{
  radius = 20;
  size(600, 600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}

void draw()
{
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  {
    if (i % 7 == 0)
    {
      background(500, 500, 500);
    }
    fill(155, 255, 200);
    if (i > 5 && i  < 10)
    {
      fill(500, 500, 500);
    }
    if (i > 11 && i < 15)
    {
      fill(200, 300, 300);
    }
    if (i % 3 == 1)
    {
      ellipse(xpos.get(i), ypos.get(i), radius*2, radius*2);
    }
    else
    {
      rect(mouseX - radius, mouseY + radius, radius * 2, radius * 2);
    }
  }
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}
