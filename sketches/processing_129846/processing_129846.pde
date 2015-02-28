
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int x;
int y;
int radius;

void setup()
{
  size(800,800);
  background(0,0,0);
  x = 100;
  y = 100;
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  radius = 15;
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  xpos.add(int(random(-50,50)));
  ypos.add(int(random(-50,50)));
  xvelocity.add(1);
  yvelocity.add(1);

}

void draw()
{
  for (int i = 0; i < xpos.size() ; i++)
  {
    background(0);
    fill(255,0,255);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
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
    
    if (ypos.get(i) < 0)
    {
      ypos.set(i,height);
    }
    
    if (ypos.get(i) > width)
    {
      ypos.set(i,0);
    }

}
  
  fill(random(255),random(255),random(255));
  triangle(392+x,538+y,435+x,538+y,412+x,496+y);

}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == RIGHT)
    {
      x = x + 5;
    }
    if (keyCode == LEFT)
    {
      x = x - 5;
    }
    if (keyCode == UP)
    {
      y = y - 5;
    }
    if (keyCode == DOWN)
    {
      y = y + 5;
    }
  }
}

void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(int(random(-10.10)));
  yvelocity.add(int(random(-10,10)));
  
}
