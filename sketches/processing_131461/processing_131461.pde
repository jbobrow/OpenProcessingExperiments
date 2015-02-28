
ArrayList<Bubble> b;

void setup()
{
  size(600,600);
  background(0);
  b = new ArrayList<Bubble>();
}

void draw()
{
  background(0);
  Bubble temp;
  for (int i = 0; i < b.size(); i++)
  {
    temp = b.get(i);
    temp.display();
    temp.updateposition();
  }
}

void mouseClicked()
{
  b.add(new Bubble(mouseX,mouseY,mouseX));  
}

class Bubble
{
  int xpos;
  int ypos;
  int xvelocity;
  int yvelocity;
  int radius;
  
  Bubble(int x, int y)
  {
    xpos = x;
    ypos = y;
    xvelocity = 1;
    yvelocity = -1;
    radius = 60;
  }
  
  Bubble(int x, int y, int r)
  {
    xpos = x;
    ypos = y;
    xvelocity = 1;
    yvelocity = -1;
    radius = r;
  }
  
  
  void display()
  {
    fill(155,255,200);
    ellipse(xpos,ypos,radius,radius);
  }
  
  void updateposition()
  {
    xpos = xpos + xvelocity;
    ypos = ypos + yvelocity;
    if (xpos > width)
    {
      xpos = 0;
    }
  }
}
    
  
  
