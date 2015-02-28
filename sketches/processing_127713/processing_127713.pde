
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int i;
int j;
int izac;
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
  for (int i = 0; i < xpos.size(); i++)
  {
    izac = i;
    if ((i >= 5) && (i <= 10))
    {
      fill(500, 500, 500);
    }
    if ((i >= 11) && (i <= 15))
    {
      fill(155, 255, 200);
    }
    if (i % 2 == 0)
    {
      rect(xpos.get(i) - 20, ypos.get(i) - 20, radius * 2, radius * 2);
    }
    else
    {
      ellipse(xpos.get(i), ypos.get(i), radius * 2, radius * 2);
    }
    if (izac % 7)
    {
      background(500, 500, 500);
    }
    else
    {
      background(1);
    }
  }

  void mouseClicked()
  {
    if (izac <= 15)
    {
      xpos.add(mouseX);
      ypos.add(mouseY);
    }
    if (izac > 15)
    {
      background(0);
      for (int j = xpos.size(); j > 0; j--)
      {
        clear();
        xpos.remove(j - 1);
        ypos.remove(j - 1);
      }
      redraw();
    }
  }
