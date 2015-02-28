
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
int radius;
int c=125;
  
void setup()
{
  radius = 20;
  size(600,600,P3D);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
}
  
void draw()
{
  background(0);
  for (int i = 0; i < xpos.size() ; i++)
  { 
    fill(142,210,173);
    if ((i >= 4) && (i < 10))
    {
      fill(255);
    }
    if ((i >= 10) && (i <= 14))
    {
      fill(50,50,255);
    }
    if (xpos.size() % 2 == 0)
    {
      rect(xpos.get(i) - radius,ypos.get(i) - radius,radius*2,radius*2);
    }
    if (xpos.size() % 2 != 0)
    {
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    if (xpos.size() % 7 == 0)
    {
      background(255);
    }
    if (i > 14)
    {
      xpos = new ArrayList<Integer>();
      ypos = new ArrayList<Integer>();
    }
  }
}
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
}
