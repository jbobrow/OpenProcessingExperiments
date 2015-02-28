
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int x;
int n;
int k;
int radius;
int c=125;
  
void setup()
{
  radius = 20;
  n = 0;
  size(600,600,P3D);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();

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
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.get(i) < 0)
    {
      xpos.set(i,width);
    }
    if (ypos.get(i) > height)
    {
      ypos.set(i,0);
    }
    if (ypos.get(i) < 0)
    {
      ypos.set(i,height);
    }
    if (i > 14)
    {
      xpos = new ArrayList<Integer>();
      ypos = new ArrayList<Integer>();
      i = 0;
    }
  }
}
 
void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  n = n + 1;
  {
    if (n == 1)
    {
      xvelocity.add(1);
      yvelocity.add(0);
    }
    if (n == 2)
    {
      xvelocity.add(-1);
      yvelocity.add(1);
    }
    if (n == 3)
    {
      xvelocity.add(1);
      yvelocity.add(2);
    }
    if (n == 4)
    {
      xvelocity.add(-1);
      yvelocity.add(3);
    }
    if (n == 5)
    {
      xvelocity.add(-1);
      yvelocity.add(0);
    }
    if (n == 6)
    {
      xvelocity.add(1);
      yvelocity.add(-1);
    }
    if (n == 7)
    {
      xvelocity.add(-1);
      yvelocity.add(-2);
    }
    if (n == 8)
    {
      xvelocity.add(1);
      yvelocity.add(-3);
    }
    if (n > 15)
    {
      n = 0;
    }
    else
    {
      x = int(random(-5,5));
      xvelocity.add(x);
      k = int(random(-5,5));
      yvelocity.add(x);
    }
  }
}
