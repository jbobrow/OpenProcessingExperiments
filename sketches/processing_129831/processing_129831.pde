
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
int xchange;
int ychange;
  
void setup()
{
  radius = 20;
  size(600,600);
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
    fill(155,255,200);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    //check xposition. If too large (off screen), warp circle to left side
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.size() % 7 == 0)
    {
      background(255);
    }
    if (xpos.size() > 4)
    {
      fill(255,255,255);
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    if (xpos.size() > 10)
    {
      fill(0,0,255);
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
    }
    if (xpos.size() % 2 == 0)
    {
      rectMode(CENTER);
      rect(xpos.get(i),ypos.get(i),45,45);
    }
    if (keyPressed == true)
    {
      fill(random(255),random(255),random(255));
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      if (xpos.size() % 2 == 0)
      {
        rectMode(CENTER);
        rect(xpos.get(i),ypos.get(i),45,45);
      }
    }     
    if (xpos.size() > 14)
    {
      background(162,162,162);
      xpos.clear();
      ypos.clear();
    }
  }
}
 
void mouseClicked()
{
  xchange = 1;
  ychange = -1;
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(1);
  yvelocity.add(-1);
  if (xpos.size() < 5)
    {
      xchange = xchange * -1;
      ychange = ychange + 1;
      xvelocity.add(xchange);
      yvelocity.add(ychange);
    }
  if (xpos.size() > 5 && xpos.size() <9)
    {
      xchange = xchange * -1;
      ychange = ychange - 1;
      xvelocity.add(xchange);
      yvelocity.add(ychange);
    }
  if (xpos.size() > 9)
    {
      xvelocity.add(random(-5,5);
      yvelocity.add(random(-5,5);
    }
}


