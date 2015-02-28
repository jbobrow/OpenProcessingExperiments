
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
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
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
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
      velocity();
    }
    else
    {
      ellipse(xpos.get(i), ypos.get(i), radius * 2, radius * 2);
      velocity();
    }
    if (izac % 7)
    {
      background(500, 500, 500);
    }
    else
    {
      background(1);
    }
    if (xpos.get(i) > width)
    {
      xpos.set(i, 0);
    }
  }
}

void mouseClicked()
{
  if (izac <= 15)
  {
    xpos.add(mouseX);
    ypos.add(mouseY);
    xvelocity.add(1);
    yvelocity.add(-1);
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

void velocity()
{
  if (izac == 1)
  {
    xpos.set(i, xpos.get(i)+xvelocity.get(i));
    ypos.set(i, ypos.get(i));
  }
  if (izac == 2)
  {
    xpos.set(i, xpos.get(i)-xvelocity.get(i));
    ypos.set(i, ypos.get(i)+yvelocity.get(i));
  }
  if (izac == 3)
  {
    xpos.set(i, xpos.get(i)+xvelocity.get(i));
    ypos.set(i, ypos.get(i)+yvelocity.get(i)(2));
  }
  if (izac == 4)
  {
    xpos.set(i, xpos.get(i)-xvelocity.get(i));
    ypos.set(i, ypos.get(i)+yvelocity.get(i)(3));
  }
  if (izac == 5)
  {
    xpos.set(i, xpos.get(i)-xvelocity.get(i));
    ypos.set(i, ypos.get(i);
  }
  if (izac == 6)
  {
    xpos.set(i, xpos.get(i)+xvelocity.get(i));
    ypos.set(i, ypos.get(i)-yvelocity.get(i));
  }
  if (izac == 7)
  {
    xpos.set(i, xpos.get(i)-xvelocity.get(i));
    ypos.set(i, ypos.get(i)-yvelocity.get(i)(2));
  }
  if (izac == 8)
  {
    xpos.set(i, xpos.get(i)-xvelocity.get(i));
    ypos.set(i, ypos.get(i)-yvelocity.get(i)(3));
  }
  else
  {
    xpos.set(i, xpos.get(i)+ random(-5,5));
    ypos.set(i, ypos.get(i)+ random(-5,5)d);
  }
