
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=255;
int g=255;

void setup()
{
  size(500,500);
  radius = 20;
  background(random(255));
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  rectMode(CENTER);
  
}

void draw()
{
  background(g);
  for (int i = 0; i < xpos.size() ; i++)
  {
    rect(mouseX,mouseY,10,10);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    fill(random(c),random(c),random(c));
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.get(i) < 0)
    {
      xpos.set(i,width);
    }
    if (ypos.get(i) > width)
    {
      ypos.set(i,0);
    }
    if (ypos.get(i) < 0)
    {
      ypos.set(i,width);
    }
  }
  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      for (int t = 0; t < xpos.size(); t++)
      {
        if (abs(mouseX-xpos.get(t)) < radius)
        {
          if (abs(mouseY-ypos.get(t)) < radius)
          {
            backy();
            background(g);
            for (int k = xpos.size() - 1; k >= 0; k--)
            {
              xpos.remove(k);
              ypos.remove(k);
              xvelocity.remove(k);
              yvelocity.remove(k);
              
            }
          }
        }
      }
    }
  }
}
      
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(int(random(-23,24)));
  yvelocity.add(int(random(-24,23)));

}

void backy()
{
  g = 0;
}
                

