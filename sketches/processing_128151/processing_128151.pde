
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
  
void setup()
{
  rectMode(CENTER);
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
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    fill(155,255,200);
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
    
    if (xpos.size() <=10 && xpos.size() >=5)
    {
    fill(255,255,255);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }
   if (xpos.size() <=15 && xpos.size() >=11)
   {
     fill(0,0,255);
    ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }

  if (xpos.size() %2==0 && xpos.size() >=5 && xpos.size() <=10)
  {
    fill(255,255,255);
    rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }
  if (xpos.size() %2==0 && xpos.size() <=15 && xpos.size() >=11)
  {
    fill(0,0,225);
    rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }
  if (xpos.size() %2==0 && xpos.size() <=4)
  {
    fill(155,255,200);
    rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
  }

  if (xpos.size() %7==0)
  {
    background(255);
  }
    if (xpos.size() > 15)
 {
  rectMode(CENTER);
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  }
  }

}
 void mouseClicked()
{
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(int(random(-23,23)));
  yvelocity.add(int(random(-23,23)));
}
void keyPressed() 
{
  if (key == TAB)
{
  background(random(255),random(255),random(255));
}

}
